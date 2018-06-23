class Player < ActiveRecord::Base
	has_many :characters

	def self.get_username
	name1 = gets.chomp
	puts ""
	puts "Welcome, #{name1}..."
	Player.find_or_create_by(username:name1)
	end


end