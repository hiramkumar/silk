# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 41) do

  create_table "client_billings", :force => true do |t|
    t.integer  "client_id"
    t.string   "order_type"
    t.string   "no_of_sarees"
    t.string   "cost_price"
    t.string   "discount"
    t.string   "rcd_amount"
    t.string   "advance"
    t.string   "balance_amt"
    t.date     "date"
    t.string   "description"
    t.string   "returned_sarees"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "contact_name"
    t.string   "address"
    t.string   "ph_no"
    t.string   "email"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cotton_billings", :force => true do |t|
    t.datetime "date"
    t.string   "type"
    t.integer  "received_qty"
    t.integer  "vendor_id"
    t.string   "description"
    t.integer  "rate"
    t.integer  "discount"
    t.integer  "adv_amt"
    t.integer  "amt_to_vendor"
    t.integer  "return_qty"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designers", :force => true do |t|
    t.datetime "date"
    t.integer  "vendor_id"
    t.string   "design_id"
    t.integer  "rate"
    t.integer  "discount"
    t.integer  "amt_to_vendor"
    t.integer  "advance"
    t.string   "description"
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dyers", :force => true do |t|
    t.integer  "worker_id"
    t.datetime "date"
    t.integer  "salary"
    t.integer  "advance_amount"
    t.string   "raw_warp_to_dyer"
    t.string   "raw_silk_to_dyer"
    t.string   "coloured_warp_from_dyer"
    t.string   "coloured_silk_from_dyer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dyes", :force => true do |t|
    t.integer  "worker_id"
    t.datetime "date"
    t.integer  "salary"
    t.integer  "advance_amount"
    t.text     "raw_warp_to_dyer"
    t.text     "raw_silk_to_dyer"
    t.string   "coloured_warp_from_dyer"
    t.string   "coloured_silk_from_dyer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "advance_reduction"
    t.string   "remarks"
    t.integer  "warp_length"
  end

  create_table "items", :force => true do |t|
    t.string   "item_code"
    t.string   "description"
    t.integer  "image_id"
    t.integer  "warp"
    t.integer  "silk"
    t.integer  "warp_cotton"
    t.integer  "weaving_cotton"
    t.string   "jari"
    t.string   "jute"
    t.integer  "expect_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jari_billings", :force => true do |t|
    t.datetime "date"
    t.string   "received_qty"
    t.string   "jari_type"
    t.integer  "rate"
    t.string   "discount"
    t.integer  "advance_amount"
    t.integer  "amount_to_vendor"
    t.string   "description"
    t.string   "batch_no"
    t.integer  "vendor_id"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jute_billings", :force => true do |t|
    t.datetime "date"
    t.string   "type"
    t.integer  "received_qty"
    t.integer  "vendor_id"
    t.string   "description"
    t.integer  "rate"
    t.integer  "discount"
    t.integer  "adv_amt"
    t.integer  "amt_to_vendor"
    t.integer  "return_qty"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "login_details", :force => true do |t|
    t.integer  "user"
    t.date     "login"
    t.date     "logout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "login_time"
    t.time     "logout_time"
  end

  create_table "logins", :force => true do |t|
    t.integer  "user"
    t.datetime "login"
    t.datetime "logout"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "looms", :force => true do |t|
    t.integer  "worker_id"
    t.datetime "entry_date"
    t.integer  "salary_amount"
    t.integer  "advance_amount"
    t.string   "warp_to_weaver"
    t.string   "silk_to_weaver"
    t.string   "jari_to_weaver"
    t.string   "jute_to_weaver"
    t.string   "weaving_cotton"
    t.string   "warp_cotton"
    t.string   "sarees_from_weaver"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "advance_reduction"
    t.integer  "saree_weight"
    t.integer  "warp_length"
  end

  create_table "sessions", :force => true do |t|
    t.text     "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "silk_billings", :force => true do |t|
    t.datetime "date"
    t.string   "type"
    t.integer  "received_silk"
    t.integer  "vendor_id"
    t.string   "description"
    t.integer  "rate"
    t.integer  "discount"
    t.integer  "adv_amt"
    t.integer  "amt_to_vendor"
    t.integer  "return_qty"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_mails", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendor_types", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "vendor_type_id"
    t.string   "address"
    t.string   "phone_no"
    t.string   "person_name"
    t.string   "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warp_billings", :force => true do |t|
    t.string   "type"
    t.datetime "date"
    t.datetime "requested_date"
    t.datetime "received_date"
    t.integer  "vendor_id"
    t.integer  "rate"
    t.integer  "discount"
    t.integer  "amt_to_warp"
    t.string   "cancel_order"
    t.integer  "return_warp"
    t.integer  "advance"
    t.integer  "warp_weight"
    t.string   "description"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "warp_length"
  end

  create_table "weavers", :force => true do |t|
    t.integer  "worker_id"
    t.datetime "date"
    t.integer  "salary"
    t.integer  "advance_amount"
    t.string   "warp"
    t.string   "silk"
    t.string   "jari"
    t.string   "jute"
    t.string   "weaving_cotton"
    t.string   "warp_cotton"
    t.string   "saree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weaves", :force => true do |t|
    t.integer  "worker_id"
    t.datetime "date"
    t.integer  "salary"
    t.integer  "advance_amount"
    t.string   "warp"
    t.string   "silk"
    t.string   "jari"
    t.string   "jute"
    t.string   "weaving_cotton"
    t.string   "warp_cotton"
    t.string   "saree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worker_types", :force => true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", :force => true do |t|
    t.integer  "title_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "address1"
    t.string   "address2"
    t.string   "referred_by"
    t.string   "phone_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "worker_type"
    t.integer  "worker_type_id"
  end

end
