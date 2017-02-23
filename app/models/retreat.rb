class Retreat < ApplicationRecord
	belongs_to :property
	has_many :reviews
	has_many :bookings
	has_many :retreat_leaders
  has_many :meal_plans

	validates :property, :start_date, :end_date, :price, presence: true

end
