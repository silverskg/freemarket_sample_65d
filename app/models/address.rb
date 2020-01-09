class Address < ApplicationRecord
  belongs_to :user,  optional: true

  # POSTAL_CODE_VALID = /\A\d{3}-\d{4}\z/i
  # # バリデーション
  validates :first_name_zenkaku,    presence: true
  validates :last_name_zenkaku,     presence: true
  validates :first_name_kana, :last_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :post_number,           presence: true, length: { is: 7 } 
  validates :prefectures,           presence: true
  validates :city,                  presence: true,  length: {maximum: 75}
  validates :addresses_banchi,      presence: true,  length: {maximum: 75}
  validates :build_name,            presence: true,  length: {maximum: 75}
  validates :phone_number,          presence: true, format: {with: /\A[0-9-]{11}\z/}
end
