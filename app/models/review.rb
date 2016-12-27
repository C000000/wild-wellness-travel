class Review < ApplicationRecord
  belongs_to :retreat
  belongs_to :user

  validates :rating, presence: true
end
