class Backpack < ApplicationRecord
  has_many :slots
  has_many :items, through: :slots
end
