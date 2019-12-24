class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,

  has_many :items
  has_many :likes
  has_many :comments
  has_one  :payment
  has_one  :address  
  validates :email, uniqueness: true
end
