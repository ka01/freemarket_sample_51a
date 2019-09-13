class Category < ApplicationRecord
  has_many :brands
  has_many :items
  has_ancestry
end
