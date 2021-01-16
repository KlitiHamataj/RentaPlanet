class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :address, presence: true
  validates :number_guests, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
