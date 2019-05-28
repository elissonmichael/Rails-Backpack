require 'test_helper'

class BackpackTest < ActiveSupport::TestCase
  attr_reader :backpack, :sword
  def setup
    @backpack = backpacks(:default) # capacity: 10, weight_limit: 20
    @sword    = items(:sword)       # size: 2, weight: 3
  end

  test '#available_capacity' do
    backpack.add(sword)
    assert_equal 8, backpack.available_capacity
    backpack.add(sword)
    assert_equal 6, backpack.available_capacity
  end

  test '#overweight?' do
    stone = items(:stone) # size: 5 weight: 15
    backpack.add(stone)
    refute backpack.overweight?
    backpack.add(stone)
    assert backpack.overweight?
  end

  test 'adds an item to the backpack' do
    backpack.add(sword)
    assert_equal [sword], backpack.items
  end

  test 'increases quantity when same item is added' do
    2.times { backpack.add(sword) }
    assert_equal 2, backpack.quantity(sword)
  end

  test 'does not increase quantity if it has not available capacity' do
    6.times { backpack.add(sword) }
    assert_equal 5, backpack.quantity(sword)
  end

  test 'does not add item if it has not available capacity' do
    5.times { backpack.add(sword) }
    bread = items(:bread) # size: 1 weight:  1
    backpack.add(bread)
    assert_equal [sword], backpack.items
    assert backpack.quantity(bread).zero?
  end
end
