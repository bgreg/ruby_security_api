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

ActiveRecord::Schema.define(version: 20140907225128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string   "cve_id"
    t.text     "summary"
    t.text     "published"
    t.string   "cvss_severity"
    t.text     "title"
    t.integer  "cvss_v2_base_score"
    t.integer  "impact_subscore"
    t.integer  "exploitability_subscore"
    t.text     "access_vector"
    t.text     "access_complexity"
    t.text     "authentication"
    t.text     "confidentiality_impact"
    t.text     "integrity_impact"
    t.text     "availablility_impact"
    t.text     "external_source_organization"
    t.text     "external_source_name"
    t.text     "external_source_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
