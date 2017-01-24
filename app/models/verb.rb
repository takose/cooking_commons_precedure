class Verb < ApplicationRecord
  has_many :steps, through: :elements
  has_many :element, as: :dictionary
end
