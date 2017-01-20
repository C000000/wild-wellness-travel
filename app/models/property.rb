class Property < ApplicationRecord
	has_many :retreats
	belongs_to :user, optional: true

	validates :name, :pictures, presence: true

	has_attachments :pictures, maximum: 10

	geocoded_by :full_address
	after_validation :geocode, if: :full_address_changed?


	def full_address
		"#{street_address}, #{city} #{state} #{ISO3166::Country[country].name}"
	end

	def full_address_changed?
		street_address_changed? || city_changed? || state_changed? || country_changed?
	end

	def country_name
		ISO3166::Country[country].alpha2 == "US" ? ISO3166::Country[country].alpha2 : ISO3166::Country[country].name
  	end

	PROPERTY_TYPE = ["House", "Hotel", "Other"]
end
