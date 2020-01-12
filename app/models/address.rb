class Address < ApplicationRecord
  belongs_to :user,  optional: true

  VALID_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  # VALID_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  # # バリデーション
  validates :first_name_zenkaku,    presence: { message: "を入力してください" },  length: {maximum: 30, message: "30字以内で入力してください。" }
  validates :last_name_zenkaku,     presence: { message: "を入力してください" },  length: {maximum: 30, message: "30字以内で入力してください。" }
  validates :first_name_kana,       format: { with: VALID_KANA_REGEX, message: "はカタカナで入力して下さい。" }
  validates :last_name_kana,        format: { with: VALID_KANA_REGEX, message: "はカタカナで入力して下さい。" }
  validates :post_number,           presence: { message: "を入力してください" }, length: { is: 7, message: "7文字で入力してください。"  } 
  validates :prefectures,           presence: { message: "を入力してください" }
  validates :city,                  presence: { message: "を入力してください" },  length: {maximum: 75}
  validates :addresses_banchi,      presence: { message: "を入力してください" }
  validates :build_name,             length: {maximum: 30, message: "の入力が正しくありません"}
  validates :phone_number,           length: { maximum: 11, message: "の入力が正しくありません" }
end
