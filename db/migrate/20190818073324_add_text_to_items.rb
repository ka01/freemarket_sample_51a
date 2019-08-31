class AddTextToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :text, :string, {null: false}
  end
end
