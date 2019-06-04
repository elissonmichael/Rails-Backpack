require 'test_helper'

class BackpacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @backpack = backpacks(:default)
  end

  test 'should get index' do
    get backpacks_url
    assert_response :success
  end

  test 'should get new' do
    get new_backpack_url
    assert_response :success
  end

  test 'should create backpack' do
    assert_difference('Backpack.count') do
      post backpacks_url, params: { backpack: { capacity: @backpack.capacity, weight_limit: @backpack.weight_limit } }
    end

    assert_redirected_to backpack_url(Backpack.last)
  end

  test 'should show backpack' do
    get backpack_url(@backpack)
    assert_response :success
  end

  test 'should get edit' do
    get edit_backpack_url(@backpack)
    assert_response :success
  end

  test 'should update backpack' do
    patch backpack_url(@backpack), params: { backpack:
      { capacity: @backpack.capacity, weight_limit: @backpack.weight_limit } }
    assert_redirected_to backpack_url(@backpack)
  end

  test 'should get new item form' do
    get new_item_form_backpack_url(@backpack)
    assert_response :success
  end

  test 'should add item' do
    assert_difference('@backpack.items.count') do
      post add_item_backpack_url(@backpack),
           params: { item_id: items(:sword).id }
    end

    assert_redirected_to backpack_url(@backpack)
  end

  test 'should not add item when backpack dont have enough capacity' do
    full_backpack = backpacks(:low_capacity)
    assert_no_difference('full_backpack.items.count') do
      post add_item_backpack_url(full_backpack),
           params: { item_id: items(:sword).id }
    end

    assert_response :success
  end

  test 'should destroy backpack' do
    assert_difference('Backpack.count', -1) do
      delete backpack_url(@backpack)
    end

    assert_redirected_to backpacks_url
  end
end
