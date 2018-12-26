class Adventure

	def get_adventure(character) # combat must have monster_type = monter name, || if non-combat, monster_type must = :none
		x = rand(1..99)
		lvl = (character.level)-1
		mult = lvl*10
		x = x + mult
		case x
			when 1..25
				#kobold
				monster_type = adventure_two(character)
				return monster_type
			when 26..40
				#goblin
				monster_type = adventure_one(character)
				return monster_type
			when 41..65
				#hobgoblin
				monster_type = adventure_three(character)
				return monster_type
			when 66..77
				#fountains
				monster_type = adventure_four(character)
				return monster_type
			when 78..88
				#find armor
				monster_type = adventure_six(character)
				return monster_type
			when 89..99
				#find weapons
				monster_type = adventure_five(character)
				return monster_type
			when 100..110
				#bugbear/direwolf
				monster_type = adventure_seven(character)
				return monster_type
			when 111..120
				#ogre
				monster_type = adventure_eight(character)
				return monster_type
			when 121..130
				#hill giant
				monster_type = adventure_nine(character)
				return monster_type
			when 131..140
				#dragon
				monster_type = adventure_ten(character)
				return monster_type
		end
	end

	def adventure_one(character)
		puts ""
		puts ""
		puts " #{character.name}, you find yourself surrounded by goblins! You must defend yourself, do you fight? Yes or No."

		answer = gets.chomp.downcase

		case answer
			when "yes", "y"
				puts ""
				puts "One rather large Goblin steps forward to challenge you..."
				puts ""
				sleep(2)
				puts "the fight begins"
				sleep(0.5)
				puts ""
				Battle.fight_animation
				Battle.fight_animation
				Battle.fight_animation
				monster_type = "Goblin"
				monster_type

			when "no", "n"
				system('clear')
				puts ""
				puts "You run like a coward, all the way back to town."
				sleep(3)
				10.times { puts ""}
				puts "           -------------------"
				puts "          |  Welcome to town  |"
				puts "           -------------------"
				10.times { puts ""}
				character.character_sheet
				character.update({status: 0})
			else
				puts ""
				puts "What's that?"
				puts ""
				adventure_one(character)
		end
	end

	def adventure_two(character)
		puts ""
		puts ""
		puts "Something is skittering behind you. you swivel around and see a KOBOLD! do you attack? Yes or No."

		answer = gets.chomp.downcase

		case answer
			when "yes", "y"
				puts ""
				puts "A kobold doesn't frighten #{character.name}!"
				puts ""
				sleep(2)
				puts "the fight begins"
				sleep(0.5)
				puts ""
				Battle.fight_animation
				Battle.fight_animation
				Battle.fight_animation
				monster_type = "Kobold"
				monster_type

			when "no", "n"
				system('clear')
				puts ""
				puts "You just ran from a kobold, you're ashamed to return to town."
				sleep(3)
				puts ""
				puts "           -------------------"
				puts "          |  Welcome to town  |"
				puts "           -------------------"
				puts ""
				puts "You are an abject failure. Not just as an adventurer. At life."
				character.character_sheet
				character.update({status: 0})
			else
				puts ""
				puts "What's that?"
				puts ""
				adventure_two(character)
		end
	end

	def adventure_three(character)
		puts ""
		puts ""
		puts "You turn a corner in the dangerous dungeon and see a Hobgoblin standing there, about to attack you."
		puts "He's big and ugly. Do you attack? Yes or no."

		answer = gets.chomp.downcase

		case answer
			when "yes", "y"
				puts ""
				puts "You swing your #{character.main_hand} with all your might!"
				puts ""
				sleep(2)
				puts "the fight begins"
				puts ""
				sleep(0.5)
				Battle.fight_animation
				Battle.fight_animation
				Battle.fight_animation
				monster_type = "Hobgoblin"
				monster_type

			when "no", "n"
				system('clear')
				puts ""
				puts "You run back to town and you realize you were so scared, you started crying."
				puts "For shame!"
				sleep(3)
				puts ""
				puts "           -------------------"
				puts "          |  Welcome to town  |"
				puts "           -------------------"
				puts ""
				puts "When you think about it, Hobgoblins are big and scary. There's no shame in running..."
				puts "You're just not very brave."
				character.character_sheet
				character.update({status: 0})
			else
				puts ""
				puts "What's that?"
				puts ""-
				adventure_three(character)
		end
	end

def adventure_four(character)
	x = rand(1..99)

	case x
		when 1..65
			# HEAL FOUNTAIN
			puts ""
			puts "You come across a fountain bubbling with clear, cool water."
			puts "Do you take a drink?"
			puts ""
			puts "    Yes  |  No"
			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					new_hp = character.max_hp
					character.update({hit_points:new_hp})
					monster_type = :none
					puts ""
					puts "You feel refreshed!"
					puts ""
					character.character_sheet
					return monster_type
				else
					puts ""
					puts "It's probably wise to avoid drinking from strange fountains in dungeons"
					puts ""
					monster_type = :none
					return monster_type
			end
		when 66..92
			# HARM FOUNTAIN
			puts ""
			puts "You come across a stagnant fountain with murky water"
			puts "You're actually pretty thirsty... Do you take a drink?"
			puts ""
			puts "    Yes  |  No"

			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					hp = (character.hit_points/2.0).round
					hp = hp.to_i
					character.update({hit_points:hp})
					monster_type = :none
					puts ""
					puts "You don't feel so well..."
					puts ""
					character.character_sheet
					return monster_type
				else
					puts ""
					puts "It's probably wise to avoid drinking from strange fountains in dungeons"
					puts ""
					monster_type = :none
					return monster_type
			end

		when 93..94
			# MAX HP++ FOUNTAIN
			puts ""
			puts "You come across a strange, otherworldly fountain"
			puts "The water has a slightly red hue... Do you take a drink?"
			puts ""
			puts "    Yes  |  No"

			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
				new_max_hp = character.max_hp + 1
				character.update({max_hp:new_max_hp})
				new_hp = character.max_hp
				character.update({hit_points:new_hp})
				monster_type = :none
				puts ""
				puts "You feel different somehow... Maybe even stronger!"
				puts ""
				character.character_sheet
				return monster_type
			else
				puts ""
				puts "It's probably wise to avoid drinking from strange fountains in dungeons"
				puts ""
				monster_type = :none
				return monster_type
			end
		when 95..96
			# +2 STATS FOUNTAIN
			puts ""
			puts "You come across a spring that glows with a magical radiance."
			puts "It's extremely tempting... Do you take a drink?"
			puts ""
			puts "    Yes  |  No"

			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					y = rand(1..3)
					case y
						when 1
							new_str = character.strength + 2
							character.update({strength:new_str})
							puts ""
							puts "You feel power rushing through your body!"
							puts ""
							character.character_sheet
						when 2
							new_dex = character.dexterity + 2
							character.update({dexterity:new_dex})
							puts ""
							puts "Your sense of alertness feels heightened!"
							puts ""
							character.character_sheet
						when 3
							new_con = character.constitution + 2
							character.update({constitution:new_con})
							new_max_hp = character.max_hp + character.level
							character.update({max_hp:new_max_hp})
							puts ""
							puts "You feel a strange sense of confidence brewing inside you!"
							puts ""
							character.character_sheet
					end
					monster_type = :none
					return monster_type
				else
					puts ""
					puts "It's probably wise to avoid drinking from strange fountains in dungeons"
					puts ""
					monster_type = :none
					return monster_type
			end
		when 96..97
			# CURSED FOUNTAIN
			puts ""
			puts "You come across a fountain"
			puts ""
			puts "You feel strangely drawn to it..."
			puts ""
			puts "It looks delicious... Do you take a drink?"
			puts ""
			puts "    Yes  |  No"

			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					# -2 to all attributes
					new_str = character.strength - 2
					new_dex = character.dexterity - 2
					new_con = character.constitution - 2
					character.update({strength:new_str})
					character.update({dexterity:new_dex})
					character.update({constitution:new_con})
					new_max_hp = character.max_hp - 1 #subtract 1 per XP level
					character.update({max_hp:new_max_hp})
					character.hit_points > character.max_hp ? character.hit_points = character.max_hp : character.hit_points
					character.update({hit_points:character.hit_points})
					monster_type = :none
					puts ""
					puts "You feel sickened... Could the fountain be cursed?"
					puts ""
					character.character_sheet
					return monster_type
				else
					puts ""
					puts "It's probably wise to avoid drinking from strange fountains in dungeons"
					puts ""
					monster_type = :none
					return monster_type
			end
		when 98..99
			# EXP FOUNTAIN
			puts ""
			puts "You come across an otherwise unremarkable fountain."
			puts "Do you take a drink?"
			puts ""
			puts "    Yes  |  No"

			answer = gets.chomp.downcase

			case answer
				when "yes", "y"
					#+20 experience_total, heals
					new_hp = character.max_hp
					character.update({hit_points:new_hp})
					new_xp = character.experience_total + 20
					character.update({experience_total: new_xp})
					monster_type = :none
					puts ""
					puts "A strange sense of clarity comes over you!"
					puts ""
					character.character_sheet
					character.check_xp
					return monster_type
				else
					puts ""
					puts "It's probably wise to avoid drinking from strange fountains in dungeons"
					puts ""
					monster_type = :none
					return monster_type
			end
		end
			system('clear')
	end

	def adventure_five(character)

		wep = ["Morning Star", "Axe", "Sword"].sample
		puts ""
		puts "you come across the body of a slain adventurer"
		puts ""
		puts "lying next to the corpse is a #{wep} that seems to be in decent condition"
		puts ""
		puts "Do you pick it up?"
		answer = gets.chomp.downcase
		case answer
			when "yes", "y"
				puts ""
				puts "You enthusiastically grab a hold of your new #{wep}"
				puts ""
				character.update({main_hand:wep})
				system('clear')
				character.character_sheet
				monster_type = :none
				return monster_type
			else
				puts ""
				puts "You're happy with your #{character.main_hand}, no reason to switch weapons now..."
				puts ""
				monster_type = :none
				system('clear')
				return monster_type
		end
	end

	def adventure_six(character)
		#armor adventure
		arm = ["Leather Armor", "Chainmail"].sample

		puts ""
		puts "you come across the body of a slain adventurer"
		puts ""
		puts "The #{arm} he was wearing still seems to be in decent condition"
		puts ""
		puts "Do you equip it?"
		answer = gets.chomp.downcase
		case answer
			when "yes", "y"
				puts ""
				puts "You enthusiastically don your new #{arm}"
				puts ""
				character.update({armor:arm})
				new_armor_value = Armor.find_by(name:arm).armor_value
				character.update({armor_value:new_armor_value})
				system('clear')
				character.character_sheet
				monster_type = :none
				return monster_type
			else
				puts ""
				puts "You're happy with your #{character.armor}, no reason to switch armor now..."
				puts ""
				monster_type = :none
				system('clear')
				return monster_type
		end
	end

	def adventure_seven(character)
		#bugbear/direwolf
		adv7 = rand(1..2)
		case adv7
			when 1
				#direwolf
				puts ""
				puts ""
				puts "You hear howling in the distance that seems to be getting closer and closer..."
				puts ""
				sleep (2)
				puts "The beast finally catches up with you, it's a wolf the size of a horse... a DIREWOLF!!!"
				puts "There's no way, you'll fight this thing... is there?"
				puts ""
				puts "    Yes  |  No"
				answer = gets.chomp.downcase

				case answer
					when "yes", "y"
						puts ""
						puts "You decide to un-\"leash\" your rabid rage on this puppy and pound it into oblivion,"
						puts "em-\"bark\"ing it on its journey to doggie heaven!"
						puts ""
						sleep(2)
						puts "the fight begins"
						sleep(0.5)
						puts ""
						Battle.fight_animation
						Battle.fight_animation
						Battle.fight_animation
						monster_type = "Direwolf"
						monster_type
					when "no", "n"
						system('clear')
						puts ""
						puts "That was a close call... You know deep in your heart you made the right move."
						puts ""
						sleep(3)
						puts ""
						puts "           -------------------"
						puts "          |  Welcome to town  |"
						puts "           -------------------"
						puts ""
						puts "The townsfolk are impressed you were able to escape from a Direwolf"
						puts ""
						puts "No one faults you for running, but a stronger warrior would have shown it \"who's a good boy\"."
						character.character_sheet
						character.update({status: 0})
					else
						puts ""
						puts "What's that?"
						puts ""
						adventure_seven(character)
				end
			when 2
				# Bugbear
				puts ""
				puts ""
				puts "You hear the sound of heavy footfalls. That's no Goblin, that's a BUGBEAR!"
				puts "This thing is a head and a half taller than you, and has a huge club."
				puts "There's no way, you'll fight this thing... is there?"
				puts ""
				puts "    Yes  |  No"
				answer = gets.chomp.downcase
				case answer
					when "yes", "y"
						puts ""
						puts "This dungeon isn't big enough for the two of us!"
						puts ""
						sleep(2)
						puts "the fight begins"
						sleep(0.5)
						puts ""
						Battle.fight_animation
						Battle.fight_animation
						Battle.fight_animation
						monster_type = "Bugbear"
						monster_type

					when "no", "n"
						system('clear')
						puts ""
						puts "That was a close call... You know deep in your heart you made the right move."
						puts ""
						sleep(3)
						puts ""
						puts "           -------------------"
						puts "          |  Welcome to town  |"
						puts "           -------------------"
						puts ""
						puts "The townsfolk are impressed you were able to escape a Direwolf"
						puts ""
						puts "The townsfolk are impressed you faced a Bugbear and lived."
						character.character_sheet
						character.update({status: 0})
					else
						puts ""
						puts "What's that?"
						puts ""
						adventure_seven(character)
				end
		end
	end

	def adventure_eight(character)
		#ogre
		puts ""
		puts ""
		puts "Holy crap!"
		puts ""
		sleep(2)
		puts "An Ogre!"
		puts "It would make sense to flee... Will you attack?"
		puts ""
		puts "    Yes  |  No"

		answer = gets.chomp.downcase

		case answer
			when "yes", "y"
				puts ""
				puts "This Ogre needs a little more #{character.main_hand} in his life!"
				puts ""
				puts "the fight begins"
				puts ""
				Battle.fight_animation
				Battle.fight_animation
				Battle.fight_animation
				monster_type = "Ogre"
				monster_type

			when "no", "n"
				system('clear')
				puts ""
				puts "Yeah. You ran away. What?"
				puts ""
				sleep(3)
				puts ""
				puts "           -------------------"
				puts "          |  Welcome to town  |"
				puts "           -------------------"
				puts ""
				puts "One day, when you're strong enough, you'll take that Ogre down..."
				puts ""
				character.character_sheet
				character.update({status: 0})
			else
				puts ""
				puts "What's that?"
				puts ""
				adventure_eight(character)
		end
	end

	def adventure_nine(character)
		#hillgiant
		puts ""
		puts ""
		puts "There's a man as big as a house. You are about to say hello- oh, shit, he's angry!"
		puts ""
		puts "Please don't try to fight this thing..."
		puts ""
		puts "Attack?"
		puts ""
		puts "    Yes (bad idea) |  No (good idea)"

		answer = gets.chomp.downcase

		case answer
			when "yes", "y"
				puts ""
				puts "You swing your #{character.main_hand} with all your might!"
				puts ""
				puts "this should be over quick."
				puts ""
				Battle.fight_animation
				Battle.fight_animation
				Battle.fight_animation
				monster_type = "Hill Giant"
				monster_type

			when "no", "n"
				system('clear')
				puts ""
				puts "That was the biggest monster you've ever seen."
				puts ""
				sleep(3)
				puts ""
				puts "           -------------------"
				puts "          |  Welcome to town  |"
				puts "           -------------------"
				puts ""
				puts "You're still brave... right?"
				puts ""
				character.character_sheet
				character.update({status: 0})
			else
				puts ""
				puts "What's that?"
				puts ""
				adventure_nine(character)
		end
	end

	def adventure_ten(character)
		#dragon
		puts ""
		puts ""
		puts "You've heard stories that Dragons exist, but you still haven't ---"
		puts ""
		puts "That's either a Dragon or a really really realistic statue of a..."
		puts ""
		puts "OMG"
		puts ""
		puts "Fight?"
		puts ""
		puts "    Yes  |  No"

		answer = gets.chomp.downcase

		case answer
			when "yes", "y"
				puts ""
				puts "You swing your #{character.main_hand} with all your might!"
				puts ""
				puts "the fight begins"
				puts ""
				Battle.fight_animation
				Battle.fight_animation
				Battle.fight_animation
				monster_type = "Hatchling Dragon"
				monster_type

			when "no", "n"
				system('clear')
				puts ""
				puts "You run back to town and you realize you were so scared, you started crying."
				puts ""
				puts "For shame!"
				sleep(3)
				puts ""
				puts "           -------------------"
				puts "          |  Welcome to town  |"
				puts "           -------------------"
				puts ""
				puts "When you think about it, Hobgoblins are big and scary. There's no shame in running..."
				puts "You're just not very brave."
				character.character_sheet
				character.update({status: 0})
			else
				puts ""
				puts "What's that?"
				puts ""
				adventure_ten(character)
		end
	end

end