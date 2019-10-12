class CreateCategoryBrandGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :category_brand_groups do |t|
      t.references :category, foreign_key: true
      t.references :brand_group, foreign_key: true
      t.timestamps
    end
  end
end
