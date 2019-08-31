class Brand < ApplicationRecord
  has_many :item
  belongs_to :category
  belongs_to :brand_group
end
