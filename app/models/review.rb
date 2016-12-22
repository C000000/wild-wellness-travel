class Review < ApplicationRecord
  belongs_to :retreat

  validates :rating, presence: true
end
