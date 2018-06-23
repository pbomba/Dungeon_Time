class CreateMonsters < ActiveRecord::Migration[5.0]

  def change
    create_table :monsters do |t|
        t.string :name
        t.integer :strength
        t.integer :dexterity
        t.integer :constitution
        t.integer :hit_dice
        t.integer :hit_points
        t.integer :armor_value
        t.string :main_hand
        t.integer :exp_value
        t.integer :gold
    end
  end
end
