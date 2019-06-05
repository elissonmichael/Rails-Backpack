require 'test_helper'
require 'minitest/mock'

class SlotTest < ActiveSupport::TestCase
  def setup
    @slot = Slot.create(quantity: 2, item: items(:sword))
  end

  test '#increase_quantity' do
    @slot.increase_quantity
    assert_equal 3, @slot.quantity
  end

  test '#size' do
    assert_equal 4, @slot.size
  end

  test '#weight' do
    assert_equal 6, @slot.weight
  end
end
