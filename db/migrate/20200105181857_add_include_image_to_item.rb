class AddIncludeImageToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :include_image, :string
  end
end
