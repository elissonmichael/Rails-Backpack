ActiveRecord::Schema.define(version: 2019_05_22_003122) do

  create_table "backpacks", force: :cascade do |t|
    t.integer "capacity"
    t.integer "weight_limit"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.integer "weight"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "backpack_id"
    t.integer "item_id"
    t.integer "quantity"
    t.index ["backpack_id"], name: "index_slots_on_backpack_id"
    t.index ["item_id"], name: "index_slots_on_item_id"
  end

end
