class Element < ApplicationRecord
  belongs_to :step
  belongs_to :dictionary, polymorphic: true
end
