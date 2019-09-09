class RemovePathFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :path, :text
  end
end
