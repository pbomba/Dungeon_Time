class CreateArmors < ActiveRecord::Migration[5.0]
  def change
  	create_table :armors do |t|
    t.string :name
    t.integer :armor_value
  	end
  end
end
