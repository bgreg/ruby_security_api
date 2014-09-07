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

ActiveRecord::Schema.define(version: 20140907222813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cves", force: true do |t|
    t.string   "summary"
    t.string   "published"
    t.integer  "cvss_severity"
    t.string   "title"
    t.integer  "cvss_v2_base_scroe"
    t.integer  "impact_subscore"
    t.integer  "exploitability_subscore"
    t.string   "access_vector"
    t.string   "access_complexity"
    t.string   "authentication"
    t.string   "impact_type"
    t.string   "web_link"
    t.string   "external_source_org"
    t.string   "external_source_name"
    t.string   "external_source_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "exposures", force: true do |t|
    t.string   "summary"
    t.string   "published"
    t.integer  "cvss_severity"
    t.string   "title"
    t.integer  "cvss_v2_base_scroe"
    t.integer  "impact_subscore"
    t.integer  "exploitability_subscore"
    t.string   "access_vector"
    t.string   "access_complexity"
    t.string   "authentication"
    t.string   "impact_type"
    t.string   "web_link"
    t.string   "external_source_organization"
    t.string   "external_source_name"
    t.string   "external_source_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
