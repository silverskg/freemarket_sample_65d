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
  validates :email, uniqueness: true
end
