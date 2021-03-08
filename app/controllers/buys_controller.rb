class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  
  def index
    @item_buy = ItemBuy.new
  end

  def create
    @item_buy = ItemBuy.new(buy_params)
    if @item_buy.valid?
      pay_item
      @item_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:item_buy).permit(:postal_code, :from_id, :municipality, :house_number, :building_name, :tell).merge(
      user_id: current_user.id, item_id: params[:item_id], buy_id: params[:buy_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if (current_user.id == @item.user_id) || !@item.buy.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
