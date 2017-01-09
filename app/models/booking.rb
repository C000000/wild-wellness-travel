class Booking < ApplicationRecord
  belongs_to :retreat
  belongs_to :user
end
