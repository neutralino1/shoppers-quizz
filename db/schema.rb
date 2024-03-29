# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141108003440) do

  create_table "answers", force: true do |t|
    t.string  "url"
    t.integer "question_id"
    t.boolean "correct"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "question_users", force: true do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "answer_id"
  end

  add_index "question_users", ["question_id"], name: "index_question_users_on_question_id", using: :btree
  add_index "question_users", ["user_id", "question_id"], name: "index_question_users_on_user_id_and_question_id", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.string "question"
  end

  add_index "questions", ["question"], name: "index_questions_on_question", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "succeeded"
  end

end
