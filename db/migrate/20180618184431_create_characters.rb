class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
        t.string :name
        t.integer :strength, default: 12
        t.integer :dexterity, default: 12
        t.integer :constitution, default: 12
        t.integer :hit_points, default: 8
        t.integer :max_hp, default: 8
        t.integer :armor_value, default: 0
        t.integer :experience_total, default: 0
        t.integer :level, default:  1
        t.string :armor, default: "Cloth Armor"
        t.string :main_hand, default: nil
        # t.string :off_hand, default:  nil
        t.integer :player_id
        t.integer :status
        t.integer :gold, default: 0
    end
  end
end
