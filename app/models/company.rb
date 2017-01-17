class Company < ApplicationRecord
	has_many :retreats
 	validates :name, :phone_number, :email, presence: true
end
