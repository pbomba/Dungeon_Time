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

ActiveRecord::Schema.define(version: 20180619195517) do

  create_table "armors", force: :cascade do |t|
    t.string  "name"
    t.integer "armor_value"
  end

  create_table "characters", force: :cascade do |t|
    t.string  "name"
    t.integer "strength",         default: 12
    t.integer "dexterity",        default: 12
    t.integer "constitution",     default: 12
    t.integer "hit_points",       default: 8
    t.integer "max_hp",           default: 8
    t.integer "armor_value",      default: 0
    t.integer "experience_total", default: 0
    t.integer "level",            default: 1
    t.string  "armor",            default: "Cloth Armor"
    t.string  "main_hand"
    t.integer "player_id"
    t.integer "status"
    t.integer "gold",             default: 0
  end

  create_table "games", force: :cascade do |t|
    t.integer "character_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string  "name"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "hit_dice"
    t.integer "hit_points"
    t.integer "armor_value"
    t.string  "main_hand"
    t.integer "exp_value"
    t.integer "gold"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
  end

  create_table "weapons", force: :cascade do |t|
    t.string  "name"
    t.integer "min_damage"
    t.integer "max_damage"
    t.integer "armor_value"
    t.integer "attack_bonus"
  end

end
