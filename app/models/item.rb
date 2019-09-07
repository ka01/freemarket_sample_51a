class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # belongs_to :brand
  # has_many :likes dependent: :destroy
  # has_many :comments dependent: :destroy
  # has_many :messages dependent: :destroy
  has_one :shipping
  accepts_nested_attributes_for :shipping
  # has_many :reviews
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  # has_one :order

  enum condition: {
    brandnew: 0,
    mint: 1,
    verygood: 2,
    good: 3,
    poor: 4,
    damege: 5
  }

  enum trading_status: {
      selling: 0,
      stop_deal: 1,
      deal: 2,
      complete: 3
  }

  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :condition
  end
end