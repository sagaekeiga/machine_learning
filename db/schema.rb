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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170617143811) do

  create_table "machines", force: :cascade do |t|
    t.date     "date"
    t.text     "tweet"
    t.text     "name"
    t.text     "text"
    t.text     "geo"
    t.text     "url"
    t.text     "mecab"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.text     "word1"
    t.text     "word2"
    t.text     "word3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
