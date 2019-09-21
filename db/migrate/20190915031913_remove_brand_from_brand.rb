class RemoveBrandFromBrand < ActiveRecord::Migration[5.2]
  def change
    remove_reference :brands, :brand, foreign_key: true
  end
end
