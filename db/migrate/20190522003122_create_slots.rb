class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.belongs_to :backpack, index: true
      t.belongs_to :item
      t.integer :quantity
    end
  end
end
