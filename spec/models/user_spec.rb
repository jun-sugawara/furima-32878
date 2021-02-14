require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき'
     it "必須項目が全て入力されていれば登録できる"do
      expect(@user).to be_valid
    end
  
  end
end
