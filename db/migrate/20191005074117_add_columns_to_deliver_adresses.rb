class AddColumnsToDeliverAdresses < ActiveRecord::Migration[5.2]
  def change
    add_column :deliver_adresses, :postcode, :integer
    add_column :deliver_adresses, :prefecture_code, :integer
  end
end
