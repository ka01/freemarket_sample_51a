class AddAncestryToSize < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :ancestry, :string
    add_index :sizes, :ancestry
  end
end
