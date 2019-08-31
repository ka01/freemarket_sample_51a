class Category < ApplicationRecord
  has_many :brands
  has_many :items
end
