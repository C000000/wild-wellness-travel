class Property < ApplicationRecord
	has_many :retreats
	belongs_to :user, optional: true
end
