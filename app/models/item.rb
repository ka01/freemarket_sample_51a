class Item < ApplicationRecord
  has_many :users, through: :purchases
  belongs_to :category
  has_many :purchases
  #以下アソシエーションは今後の実装で必要な為、コメントアウトを残しています
  # belongs_to :brand
  # has_many :likes dependent: :destroy
  # has_many :comments dependent: :destroy
  # has_many :messages dependent: :destroy
  has_one :shipping, dependent: :destroy
  accepts_nested_attributes_for :shipping
  belongs_to :size
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