class RemoveShippingFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_reference  :items, :shipping

  end
end
