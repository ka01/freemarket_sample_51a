class CategoryBrandGroup < ApplicationRecord
  belongs_to :brand_group
  belongs_to :category
end
