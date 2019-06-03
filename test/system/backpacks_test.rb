require 'application_system_test_case'

class BackpacksTest < ApplicationSystemTestCase
  setup do
    @backpack = backpacks(:default)
  end

  test 'visiting the index' do
    visit backpacks_url
    assert_selector 'h1', text: 'Backpacks'
  end

  test 'creating a Backpack' do
    visit backpacks_url
    click_on 'New Backpack'

    fill_in 'Capacity', with: @backpack.capacity
    fill_in 'Weight limit', with: @backpack.weight_limit
    click_on 'Create Backpack'

    assert_text 'Backpack was successfully created'
    click_on 'Back'
  end

  test 'updating a Backpack' do
    visit backpacks_url
    click_on 'Edit', match: :first

    fill_in 'Capacity', with: @backpack.capacity
    fill_in 'Weight limit', with: @backpack.weight_limit
    click_on 'Update Backpack'

    assert_text 'Backpack was successfully updated'
    click_on 'Back'
  end

  test 'adding a new item' do
    visit backpack_url(@backpack)
    add_big_stone
    assert_text 'Item was successfully added.'
  end

  test 'adding the same item increases its quantity' do
    visit backpack_url(@backpack)
    2.times { add_big_stone }
    assert_selector 'td', text: '2'
  end

  test 'adding an item that cannot fit into the backpack' do
    visit backpack_url(backpacks(:low_capacity))
    add_big_stone
    assert_text 'This Item Cannot Fit Into This Backpack'
  end

  test 'destroying a Backpack' do
    visit backpacks_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Backpack was successfully destroyed'
  end

  private

  def add_big_stone
    click_on 'Add Item'
    select('Big Stone (size: 5 weight: 15)', from: 'item_id')
    click_on 'Add Item'
  end
end
