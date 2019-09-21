class RemoveSizeFromSizes < ActiveRecord::Migration[5.2]
  def change
    remove_column :sizes, :size, :string
  end
end
