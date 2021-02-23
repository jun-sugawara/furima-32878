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

    context '商品出品がうまくいかないとき' do
      it '商品画像が選択されていなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが選択されていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it '商品の状態が選択されていないと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State Select')
      end
      it '配送料の負担が選択されていないと出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee Select')
      end
      it '発送元の地域が選択されていないと出品できない' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('From Select')
      end
      it '発送までの日数が選択されていないと出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day Select')
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は半角数字でなければ出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格は半角英語だけでは出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格は半角英数字混合では出品できない' do
        @item.price = 'test5００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it '販売価格が¥299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '販売価格が¥10,000,000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
