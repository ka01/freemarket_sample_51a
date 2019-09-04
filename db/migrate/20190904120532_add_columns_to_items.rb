class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size, :integer, {null: false}
    add_column :items, :trading_status, :integer, {null: false}
  end
end
