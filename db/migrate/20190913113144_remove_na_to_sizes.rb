class RemoveNaToSizes < ActiveRecord::Migration[5.2]
  def change
    remove_column :sizes, :name, :string
  end
end
