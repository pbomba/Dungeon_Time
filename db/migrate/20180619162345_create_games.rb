class CreateGames < ActiveRecord::Migration[5.0]
  def change
  	create_table :games do |t|
    t.integer :character_id
	end
  end
end
