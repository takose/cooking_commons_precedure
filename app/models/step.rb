class Step < ApplicationRecord
  belongs_to :recipe
  has_many :elements, dependent: :destroy
  has_many :materials, through: :elements, source: :dictionary, source_type: 'Material'
  has_many :tools, through: :elements, source: :dictionary, source_type: 'Tool'
  has_many :verbs, through: :elements, source: :dictionary, source_type: 'Verb'
end
