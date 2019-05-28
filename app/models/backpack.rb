class Backpack < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :items, through: :slots
  validates_presence_of :capacity, :weight_limit
  validates :capacity, :weight_limit, numericality: { greater_than: 0 }

  def add(item)
    return not_enough_space unless fit?(item)

    if items.include?(item)
      slot_with(item).increase_quantity
    else
      slots.create(quantity: 1, item_id: item.id)
    end
  end

  def fit?(item)
    item.size <= available_capacity
  end

  def available_capacity
    capacity - slots.sum(&:size)
  end

  def overweight?
    slots.sum(&:weight) > weight_limit
  end

  def quantity(item)
    return 0 unless slot_with(item)

    slot_with(item).quantity
  end

  private

  def not_enough_space
    errors.add(:capacity, 'This Item Cannot Fit Into This Backpack')
  end

  def slot_with(item)
    slots.detect { |slot| slot.item == item }
  end
end
