class Slot < ApplicationRecord
  belongs_to :backpack
  belongs_to :item
end
