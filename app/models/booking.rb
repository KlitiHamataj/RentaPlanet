class Booking < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  validates :planet, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_guests, presence: true
end
