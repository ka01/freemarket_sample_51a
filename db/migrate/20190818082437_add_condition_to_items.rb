class AddConditionToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition, :string, {null: false}
  end
end
