class Item < ApplicationRecord
    belongs_to :category
    belongs_to :brand
    has_many :images, dependent: :destroy
    #ネストしたテーブルに同時保存するための記述
    accepts_nested_attributes_for :images, allow_destroy:true
    has_many :comments
    has_many :likes

    validates :images, length:{ minimum: 1, maximum: 10 , message: "画像がありません"}
    validates :name, presence: { message: "入力してください" }, length:{ maximum: 40, message: "40字以内で入力してください" }
    validates :status, presence: { message: "選択してください" }
    validates :body, presence: { message: "入力してください" }, length:{ maximum: 1000, message: "1000字以内で入力してください" }
    validates :deliver_fee, presence: { message: "選択してください" }
    validates :delivery_date, presence: { message: "選択してください" }
    validates :how_to_deliver, presence: { message: "選択してください" }
    validates :region, presence: { message: "選択してください" }
    validates :price, numericality: { message: "300以上9999999以下で入力してください", only_integer: true, greater_than: 299, less_than: 10000000 }
    validates :category_id, presence: { message: "選択してください" }
    validates :brand_id, presence: { message: "選択してください" }
end
