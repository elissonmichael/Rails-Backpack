class Slot < ApplicationRecord
  belongs_to :backpack
  belongs_to :item
  validates_presence_of :quantity

  def increase_quantity
    update_attribute(:quantity, quantity + 1)
  end

  def size
    quantity * item.size
  end

  def weight
    quantity * item.weight
  end
end
