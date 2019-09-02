class AddCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :item, foreign_key: true
  end
end
