class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.boolean :fee_burden, null: false
      t.integer :service, null: false
      t.integer :area, null: false
      t.integer :handling_time, null: false
      t.timestamps
    end
  end
end
