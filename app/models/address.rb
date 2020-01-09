class Address < ApplicationRecord
  belongs_to :user,  optional: true

  # POSTAL_CODE_VALID = /\A\d{3}-\d{4}\z/i
  # # バリデーション
  validates :post_number,           presence: true
  validates :prefectures,           presence: true
  validates :city,                  presence: true
  validates :addresses_banchi,      presence: true
  validates :build_name,            presence: true
  validates :phone_number,          presence: true
end
