class RemoveAuthorFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliver_adresses, :zip_code, :string
    remove_column :deliver_adresses, :prefecture, :string
  end
end
