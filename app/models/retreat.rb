class Retreat < ApplicationRecord
	belongs_to :property
	has_many :reviews, dependent: :destroy
  	has_many :bookings, dependent: :destroy
  	has_many :retreat_leaders, dependent: :destroy

	validates :property, :start_date, :end_date, :price, presence: true

end
