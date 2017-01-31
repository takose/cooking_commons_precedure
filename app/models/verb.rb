class Verb < ApplicationRecord
  has_many :steps, through: :elements
  has_many :elements, as: :dictionary
  has_many :img_urls
end
