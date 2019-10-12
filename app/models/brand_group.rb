class BrandGroup < ApplicationRecord
  has_many :brands
  has_many :category_brand_groups
  has_many :categories, through: :category_brand_groups
end
