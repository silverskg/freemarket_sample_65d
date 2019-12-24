class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string      :card_number,        null: false, unique: true
      t.integer     :year,               null: false
      t.integer     :month,              null: false
      t.integer     :security_number,    null: false
      t.bigint      :user_id,            foreign_key: true
      
      t.timestamps
    end
  end
end
