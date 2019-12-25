class DropTableDate < ActiveRecord::Migration[5.2]
  def change
    drop_table :years
    drop_table :months
  end
end
