class Backpack < ApplicationRecord
  has_many :slots
  has_many :items, through: :slots
  validates_presence_of :capacity, :weight_limit
  validates :capacity, :weight_limit, numericality: { greater_than: 0 }

  def add(item)

  end
end
