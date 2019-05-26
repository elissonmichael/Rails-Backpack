class CreateBackpacks < ActiveRecord::Migration[5.2]
  def change
    create_table :backpacks do |t|
      t.integer :capacity
      t.integer :weight_limit
    end
  end
end
