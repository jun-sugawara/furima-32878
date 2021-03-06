class ItemBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :from_id, :municipality, :house_number, :building_name, :tell, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :from_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :house_number
    validates :tell, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :user_id
    validates :item_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, from_id: from_id, municipality: municipality, house_number: house_number,
                   tell: tell, buy_id: buy.id)
  end
end
