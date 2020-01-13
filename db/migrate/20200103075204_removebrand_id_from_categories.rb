class RemovebrandIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :brand_id
  end
end
