class Item < ApplicationRecord
    belongs_to :category
    belongs_to :brand
    has_many :images, dependent: :destroy
    #ネストしたテーブルに同時保存するための記述
    accepts_nested_attributes_for :images
    has_many :comments
    has_many :likes

    validates :name, presence: true, length:{ maximum: 40 }
    validates :status, presence: true
    validates :body, presence: true, length:{ maximum: 999 }
    validates :deliver_fee, presence: true
    validates :delivery_date, presence: true
    validates :how_to_deliver, presence: true
    validates :region, presence: true
    validates :price, presence: true, numericality: {only_integer: true, greater_than: 300, less_than: 10000000 }
    validates :include_image, presence: true
end
