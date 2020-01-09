class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :items
  has_many :likes
  has_many :comments
  has_one  :payment
  has_one  :address  
  
  accepts_nested_attributes_for :address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :nickname,              presence: true, length: {maximum: 20}
  validates :email,                 presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128}, format: { with: PASSWORD_VALIDATION }   
  validates :first_name_zenkaku,    presence: true
  validates :last_name_zenkaku,     presence: true
  validates :first_name_kana, :last_name_kana,  presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birthday,              presence: true
  # validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}      
end 