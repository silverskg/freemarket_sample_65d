class RenameLastNameZernkakuToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :last_name_zernkaku, :last_name_zenkaku
  end
end
