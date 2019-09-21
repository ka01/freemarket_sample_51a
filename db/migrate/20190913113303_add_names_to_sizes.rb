class AddNamesToSizes < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :kind, :string
  end
end
