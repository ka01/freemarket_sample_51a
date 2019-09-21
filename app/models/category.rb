class Category < ApplicationRecord
  has_many :brands
  has_many :items
  has_one :category_size
  has_one :size, through: :category_size
  has_ancestry
end
