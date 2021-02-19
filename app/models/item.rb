class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :from_id
    validates :day_id
    validates :price, length: { in: 300..9999999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :state_id
  belongs_to :fee_id
  belongs_to :from_id
  belongs_to :day_id
end
