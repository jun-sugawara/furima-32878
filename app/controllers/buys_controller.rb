class BuysController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @item_buy = ItemBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_buy = ItemBuy.new(buy_params) 
    if @item_buy.valid?
      @item_buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def buy_params
    params.require(:item_buy).permit(:postal_code, :from_id, :municipality, :house_number, :building_name, :tell).merge(user_id: current_user.id, item_id: params[:item_id], buy_id: params[:buy_id])
  end

end
