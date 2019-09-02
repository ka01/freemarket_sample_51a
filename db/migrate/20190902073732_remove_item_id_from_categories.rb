class RemoveItemIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference  :categories, :item
  end
end
