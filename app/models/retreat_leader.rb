class RetreatLeader < ApplicationRecord
	belongs_to :retreat, optional: true

	validates :first_name, :last_name, :pictures, presence: true
	
	has_attachments :pictures, maximum: 10
end
