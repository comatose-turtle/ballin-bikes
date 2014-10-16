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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141015234633) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "email"
    t.boolean  "mailing_list"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "preferred_contact_method"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "service_id"
    t.string   "name"
    t.string   "options"
    t.decimal  "parts_cost", :precision => 8, :scale => 2
    t.decimal  "labor_cost", :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "line_items", ["service_id"], :name => "index_line_items_on_service_id"

  create_table "services", :force => true do |t|
    t.integer  "customer_id"
    t.string   "item_description"
    t.decimal  "est_dollar",                                            :precision => 8, :scale => 2
    t.date     "est_by",                                 :limit => 255
    t.boolean  "save_old_parts"
    t.integer  "number_of_items"
    t.string   "status"
    t.string   "color"
    t.string   "model"
    t.string   "make"
    t.datetime "due_date"
    t.text     "completion_signature"
    t.date     "ready_and_notified_date"
    t.string   "work_performed_by"
    t.text     "customer_comments"
    t.text     "authorized"
    t.decimal  "call_customer_if_repair_exceeds_amount",                :precision => 8, :scale => 2
    t.text     "mechanics_comments_and_recommendations"
    t.text     "safety_warning_signature"
    t.date     "safety_warning_date"
    t.boolean  "safety_warning_listed"
    t.boolean  "safety_warning_accepted"
    t.decimal  "parts_total",                                           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "labor_total",                                           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",                                                   :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",                                                 :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                                                           :null => false
    t.datetime "updated_at",                                                                                           :null => false
  end

  add_index "services", ["customer_id"], :name => "index_services_on_customer_id"

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
