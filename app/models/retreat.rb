class Retreat < ApplicationRecord
	belongs_to :company
	has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

	has_attachments :pictures, maximum: 10

	validates :country, :city, :street_address, :price, presence: true

	geocoded_by :full_address
	after_validation :geocode, if: :full_address_changed?


	def full_address
		"#{street_address}, #{city} #{state} #{ISO3166::Country[country].name}"
	end

	def full_address_changed?
		street_address_changed? || city_changed? || state_changed? || country_changed?
	end
end
