class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :from_id
    validates :day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :from
  belongs_to :day
end
