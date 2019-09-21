class AddKindToSizes < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :kind, :string, null: true
  end
end
