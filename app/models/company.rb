class Company < ApplicationRecord
  validates :name, :phone_number, :email, presence: true
end
