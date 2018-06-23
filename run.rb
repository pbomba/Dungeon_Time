require_relative 'config/environment'

ActiveRecord::Base.logger = nil # comment out if want to see SQL logs

system('clear')
	pid = fork{ exec 'afplay', "media/Far-Away-Places-Call.mp3"}
	# sleep(132)

current_character = Game.welcome
current_game = Game.new_game(current_character)

current_game.weapon_choice

current_game.character.character_sheet

# status = :in_town

# Game.current_status(status, current_game.character)

# status = current_game.town(current_game.character)

# if status == :adventuring


status = current_game.character.status # status is set to 0 = in town, 1 = adventuring, 2 = dead


while status < 2
	case status
	when 0
		current_game.town(current_game.character)
		status = current_game.character.status
	when 1
		monster_type = current_game.get_adventure(current_game.character)
		if current_game.character.status == 0
			status = current_game.character.status
			redo
		else
			if monster_type == :none
				redo
			else
				current_monster = Monster.generate_monster(monster_type)
				encounter_result = Battle.combat(current_game.character, current_monster)
				status = current_game.character.status
				system("clear")

				puts ""
				puts "Your current status:"
				puts ""
				current_game.character.character_sheet
			end
		end
	end
end

current_game.game_over(current_game.character)
pid = fork{ exec 'killall', "afplay" }
# 	monster_type = current_game.adventure_one(current_game.character)

# 	current_monster = Monster.generate_monster(monster_type)

# 	encounter_result = Battle.combat(current_game.character, current_monster)

# current_game.character.character_sheet

# 	# 	if encounter_result = "alive"
# 	# 	# more encounters
# 	# 	puts 'what do you wanna do now?'
# 	# 	# gets.chomp
# 	# 		#if...
# 	# else Game.game_over

# else current_game.town(current_game.character)
# end


# def self.current_status(status, character)
# 	status = current_game.town(character)

# 	if status == :adventuring

# 	monster_type = current_game.adventure_one(character)

# 	current_monster = Monster.generate_monster(monster_type)

# 	encounter_result = Battle.combat(character, current_monster)

# 	else
# 		current_status(:in_town, character)
# 	end
# end
