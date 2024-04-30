# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_04_30_175919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.string "symbol"
    t.string "marketCenter"
    t.integer "bidQuantity"
    t.integer "askQuantity"
    t.decimal "bidPrice"
    t.decimal "askPrice"
    t.datetime "startTime"
    t.datetime "endTime"
    t.string "quoteConditions"
    t.string "sipFeed"
    t.string "sipfeedSeq"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symbol", "startTime", "endTime", "askPrice"], name: "index_orders_on_ask_times_and_price_asc"
    t.index ["symbol", "startTime", "endTime", "bidPrice"], name: "index_orders_on_bid_times_and_price_desc", order: { bidPrice: :desc }
  end

end
