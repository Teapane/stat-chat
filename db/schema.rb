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

ActiveRecord::Schema.define(version: 20140220201946) do

  create_table "scores", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commits_score",           default: 0
    t.integer  "public_repo_score",       default: 0
    t.integer  "contributed_repos_score", default: 0
    t.integer  "hibernating_score",       default: 0
    t.integer  "nitpicks_score",          default: 0
    t.integer  "submissions_score",       default: 0
    t.integer  "languages_score",         default: 0
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "nickname"
    t.integer  "commits",    default: 0
  end

end
