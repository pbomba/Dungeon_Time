class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :min_damage
      t.integer :max_damage
      t.integer :armor_value
      t.integer :attack_bonus
    end
  end
end
