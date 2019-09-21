class RemoveCategoryFromBrand < ActiveRecord::Migration[5.2]
  def change
    remove_reference :brands, :category, foreign_key: true
  end
end
