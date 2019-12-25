class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,               null: false
      t.string     :status,             null: false
      t.string     :deliver_fee,        null: false
      t.string     :delivery_date,      null: false
      t.string     :how_to_deliver,     null: false  
      t.string     :region,             null: false
      t.string     :price,              null: false 
      t.text       :body,               null: false
      t.references     :user,            foreign_key: true
      
      t.timestamps
    end
  end
end
