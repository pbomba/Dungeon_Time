class CreatePlayers < ActiveRecord::Migration[5.0]

  def change
    create_table :players do |t|
    t.string :username
    end
  end

end
