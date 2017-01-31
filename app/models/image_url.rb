class ImageUrl < ApplicationRecord
  belongs_to :dictionary, polymorphic: true
  has_one :element
end
