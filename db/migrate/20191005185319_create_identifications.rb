class CreateIdentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :identifications do |t|
      t.integer :postcode
      t.integer :prefecture_code
      t.string :city
      t.string :address1
      t.string :address2
      t.references :user
      t.timestamps
    end
  end
end
