class Booking < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  validates :planet, presence: true
  valdiates :user, presence: true
end
