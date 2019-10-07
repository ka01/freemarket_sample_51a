class Category < ApplicationRecord
  has_many :brands
  has_many :items
  has_one :category_size
  has_one :size, through: :category_size
  has_one :category_brand_group
  has_one :brand_group, through: :category_brand_group

  has_ancestry
end
