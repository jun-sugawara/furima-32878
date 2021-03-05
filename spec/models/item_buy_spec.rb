require 'rails_helper'

RSpec.describe ItemBuy, type: :model do
  before do
    @item_buy = FactoryBot.build(:item_buy)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it '必須項目が全て入力されていれば購入できる' do
        expect(@item_buy).to be_valid
      end
    end

    context '商品購入がうまくいかない時'do
      it "郵便番号が空では購入ができない" do
        @item_buy.postal_code = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンがなければ購入ができない" do
        @item_buy.postal_code = '1111111'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Postal code Input correctly")        
      end
      it "都道府県が空では購入ができない" do
        @item_buy.from_id = 1
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("From Select")
      end
      it "市区町村が空では購入ができない" do
        @item_buy.municipality = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空では購入ができない" do
        @item_buy.house_number = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空では購入ができない" do
        @item_buy.tell = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Tell can't be blank")
      end
      it "電話番号にはハイフンがあると購入ができない" do
        @item_buy.tell = '090-1111-1111'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Tell Input only number")
      end
      it "郵便番号が空では購入ができない" do
        @item_buy.postal_code = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Postal code can't be blank")
      end
    end

    
  end
end
