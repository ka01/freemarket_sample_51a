class ChangeFeeBurdenToShippings < ActiveRecord::Migration[5.2]
  def change
    change_column :shippings, :fee_burden, :integer, {null: false}
  end
end
