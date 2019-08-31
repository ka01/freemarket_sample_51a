class AddItemToShippings < ActiveRecord::Migration[5.2]
  def change
    add_reference :shippings, :item, foreign_key: true
  end
end
