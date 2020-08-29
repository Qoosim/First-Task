ActiveRecord::Schema.define(version: 2020_08_29_155602) do

  create_table "tasks", force: :cascade do |t|
    t.string "task"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
