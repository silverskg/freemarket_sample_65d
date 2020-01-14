class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]


  has_many :items
  has_many :likes
  has_many :comments
  has_one  :payment
  has_one  :address  
  has_many :sns_credential
  
  accepts_nested_attributes_for :address
  VALID_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :nickname,              presence: { message: "を入力してください" },  length: {maximum: 20, message: "20字以内で入力してください" }
  validates :email,                 presence: { message: "を入力してください" }, uniqueness: { message: "はすで使われています" }, format: { with: VALID_EMAIL_REGEX, message: "フォーマットが不適切です" }
  validates :password,              presence: { message: "を入力してください" },  format: { with: PASSWORD_VALIDATION, message: "フォーマットが不適切です" }   
  validates :first_name_zenkaku,    presence: { message: "を入力してください" },  length: {maximum: 30, message: "30字以内で入力してください" }
  validates :last_name_zenkaku,     presence: { message: "を入力してください" },  length: {maximum: 30, message: "30字以内で入力してください" }
  validates :first_name_kana,    format: { with: VALID_KANA_REGEX, message: "はカタカナで入力して下さい" }
  validates :last_name_kana,    format: { with: VALID_KANA_REGEX, message: "はカタカナで入力して下さい" }
  validates :birthday,              presence: { message: "を入力してください" }
  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
end 