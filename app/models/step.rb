class Step < ApplicationRecord
  belongs_to :recipe
  has_many :elements, dependent: :destroy
  has_many :verbs, through: :elements
  has_many :materials, through: :elements
  has_many :tools, through: :elements
end
