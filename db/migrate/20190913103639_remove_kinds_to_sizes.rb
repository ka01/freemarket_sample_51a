class RemoveKindsToSizes < ActiveRecord::Migration[5.2]
  def change
    remove_column :sizes, :kind, :string
  end
end
