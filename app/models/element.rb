class Element < ApplicationRecord
  belongs_to :step
  belongs_to :dictionary, polymorphic: true
  belongs_to :image_url
end
