class Item < ApplicationRecord
    belongs_to :category
    belongs_to :brand
    has_many :images, dependent: destroy
    accepts_nested_attributes_for :images
    has_many :comments
    has_many :likes
end
