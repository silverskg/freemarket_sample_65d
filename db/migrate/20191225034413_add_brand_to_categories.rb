class AddBrandToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference  :categories, :brand, foreign_key: true
  end
end
