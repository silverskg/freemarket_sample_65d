class Payment < ApplicationRecord
  belongs_to :user
  validates :card_number, unique: true
end
