class AddSaleToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sale_status, :string
  end
end
