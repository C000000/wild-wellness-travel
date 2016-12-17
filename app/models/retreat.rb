class Retreat < ApplicationRecord
  has_attachments :pictures, maximum: 10
end
