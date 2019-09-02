class RemoveCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :categories, column: :item_id
  end
end
