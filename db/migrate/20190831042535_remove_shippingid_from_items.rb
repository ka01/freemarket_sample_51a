class RemoveShippingidFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, column: :shipping_id
  end
end
