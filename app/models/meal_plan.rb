class MealPlan < ApplicationRecord
  belongs_to :retreat, optional: true
  validates :name, presence: true
end
