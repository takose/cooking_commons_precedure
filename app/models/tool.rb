class Tool < ApplicationRecord
  has_many :steps, through: :elements
  has_many :elements, as: :dictionary
  has_many :image_urls, as: :dictionary
end
