class CreateDeliverAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliver_adresses do |t|
      t.references :user,                      null: false, foreign_key: true
      t.string     :family_name,               null: false
      t.string     :first_name,                null: false
      t.string     :family_name_kana,          null: false
      t.string     :first_name_kana,           null: false
      t.string     :zip_code,                  null: false
      t.string     :prefecture,                null: false
      t.string     :city,                      null: false
      t.string     :adress1,                   null: false
      t.string     :adress2
      t.string     :telephone,                 unique: true
      t.timestamps
    end
  end
end
