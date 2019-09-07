class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :users
    remove_reference :items, :user, index: true
  end
end
