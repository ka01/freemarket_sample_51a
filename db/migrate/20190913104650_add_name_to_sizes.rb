class AddNameToSizes < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :name, :string
  end
end
