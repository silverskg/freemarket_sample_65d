class AddFirstNameZenkakuLastNameZenkakuFirstNameKanaLastNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :first_name_zenkaku, :string
    add_column :addresses, :last_name_zenkaku, :string
    add_column :addresses, :first_name_kana, :string
    add_column :addresses, :last_name_kana, :string
  end
end
