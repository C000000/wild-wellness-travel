class RetreatLeader < ApplicationRecord
	belongs_to :retreat, optional: true

	validates :first_name, :last_name, :pictures, presence: true

  default_scope { order(:last_name) }

	has_attachments :pictures, maximum: 10

	def to_s
		"#{first_name} #{last_name}"
	end
end
