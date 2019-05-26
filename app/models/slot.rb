class Slot < ApplicationRecord
  belongs_to :backpack
  belongs_to :item
  validates_presence_of :quantity
end
