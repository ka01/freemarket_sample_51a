class AddItemImageToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_images, :item, foreign_key: true
  end
end
