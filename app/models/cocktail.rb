class Cocktail < ApplicationRecord
  belongs_to :base_spirit
  validates :name, presence: true
  validates :instructions, presence: true
end
