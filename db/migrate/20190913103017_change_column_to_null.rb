class ChangeColumnToNull < ActiveRecord::Migration[5.2]

  def up
    change_column :sizes, :kind, :string, null: true
  end

  def down
    change_column :sizes, :kind, :string, null: false
  end
end
