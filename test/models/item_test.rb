require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @sword = items(:sword)
  end

  test '#to_s' do
    assert_equal 'Silver Sword (size: 2 weight: 3)', @sword.to_s
  end
end
