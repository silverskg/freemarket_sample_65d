class RemoveIncludeImageFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :include_image, :string
  end
end
