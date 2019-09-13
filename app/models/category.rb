class Category < ApplicationRecord
  has_many :brands
  has_many :items
  has_many :sizes, through: :category_sizes
  has_ancestry
end
