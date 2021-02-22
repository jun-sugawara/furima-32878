require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '必須項目が全て入力されていれば商品を出品できる' do
        expect(@item).to be_valid
      end
    end
  end
end