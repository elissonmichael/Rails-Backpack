class Item < ApplicationRecord
  validates_presence_of :name, :size, :weight
  validates :size, :weight, numericality: { greater_than: 0 }

  def to_s
    "#{name} (size: #{size} weight: #{weight})"
  end
end
