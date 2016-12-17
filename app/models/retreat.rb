class Retreat < ApplicationRecord
  has_attachments :pictures, maximum: 10

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  def full_address
    "#{street_address}, #{zip_code} #{city} #{state} #{ISO3166::Country[country].name}"
  end

  def full_address_changed?
    street_address_changed? || zip_code_changed? || city_changed? || state_changed? || country_changed?
  end
end
