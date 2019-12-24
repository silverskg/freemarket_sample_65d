class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string           :build_name
      t.string           :addresses_banchi,     null: false
      t.string           :phone_number
      t.string           :prefectures,          null: false
      t.string           :city,                 null: false
      t.integer          :post_number,          null: false
      t.bigint           :user_id,              foreign_key: true
      
      t.timestamps
    end
  end
end
