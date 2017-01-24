class ImageUrl < ApplicationRecord
  belongs_to :dictionary, polymorphic: true
end
