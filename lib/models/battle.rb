class Battle # < ActiveRecord::Base
	# belongs_to :character
	# belongs_to :monster

	#player_attack =rand main_hand.min_damage..main_hand.max_damage
	#monster_attack

	# character and monster are passed in

	def self.attack_damage(attacker)
			min_dam = Weapon.find_by(name:attacker.main_hand).min_damage
			max_dam = Weapon.find_by(name:attacker.main_hand).max_damage
			damage = rand(min_dam..max_dam) + Monster.attribute_bonus(attacker.strength)
			damage
	end

		def self.combat(attacker, defender)
			attacker.class == Character ? level = attacker.level : level = attacker.hit_dice
			attacker.class == Character ? weapon_bonus = Weapon.find_by(name:attacker.main_hand).attack_bonus : weapon_bonus = 0

			if (rand(1..20) + level + Monster.attribute_bonus(attacker.dexterity) + weapon_bonus) >= (3 + defender.armor_value + Monster.attribute_bonus(defender.dexterity))
				damage = attack_damage(attacker)
				damage < 0 ? damage = 0 : damage
				if defender.class == Character
					new_hp = defender.hit_points - damage
					sleep(1)
					puts "#{attacker.name} does #{damage} damage to #{defender.name}"
					defender.update({hit_points: new_hp})
				else
					new_hp = defender.hit_points - damage
					sleep(1)
					puts "#{attacker.name} does #{damage} damage to #{defender.name}"
					defender.hit_points = new_hp
				end
			else
				puts "#{attacker.name} misses #{defender.name}"
			end

			if defender.hit_points > 0
				combat(defender, attacker)
			else
				if attacker.class == Character
					puts "#{defender.name} keels over and dies!"
					sleep(2)
					puts "#{attacker.name} wins the battle!"
					if defender.name == "Kobold" || defender.name == "Goblin" || defender.name == "Hobgoblin"
						def_w = defender.main_hand
						att_w = attacker.main_hand
						if def_w != att_w
							puts ""
							puts "The #{defender.name} still grips the #{defender.main_hand} is his cold, dead hand."
							puts ""
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
									attacker.update({main_hand:defender.main_hand})
								else
							end
						else
						end
					elsif defender.name == "Bugbear"
						t = rand(1..4)
						case t
						when 1, 2 #leather
							puts ""
							puts "You saved a peasant when you killed the Bugbear. He offers you his family heirloom, a non magical Warhammer."
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
							attacker.update({main_hand:"Hammer"})
							attacker.character_sheet
								else
							end
						when 3 #great club
							puts ""
							puts "This tree branch that the Bugbear wielded would serve as an excellent Great Club."
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
							attacker.update({main_hand:"Great Club"})
							attacker.character_sheet
								else
							end
						when 4 # nothing
							puts ""
							puts "You open the Bugbear's treasure chest to find a Great Sword in excellent condition."
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
							attacker.update({main_hand:"Great Sword"})
							attacker.character_sheet
								else
							end
						end

					elsif defender.name == "Direwolf"
							puts "The direwolf has no treasure to speak of... But you manage to find a few gold coins scattered about."
							attacker.character_sheet
							
					elsif defender.name == "Ogre"
						t = rand(1..4)
						case t
						when 1, 2 # nothing
							puts ""
							puts "You start to search the body, but it smells so bad you decide to walk away."
						when 3 # Axe
							puts ""
							puts "In the Ogre's bag there's a well-worn Axe with an impossibly sharp blade."
							#Axe flavor text
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
							attacker.update({main_hand:"+1 Axe"})
							attacker.character_sheet
								else
							end
						when 4 # Chainmail
							puts ""
							puts "The Ogre seems to have killed a fairly well equipped warrior recently."
							puts "The helmet is smashed, but the rest of the armor would make a decent suit of Plate Armor."
							puts ""
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
									attacker.update({armor:"Plate Armor"})
									new_armor_value = Armor.find_by(name:"Plate Armor").armor_value
									attacker.update({armor_value:new_armor_value})
									attacker.character_sheet
								else
							end
						end

					elsif defender.name == "Hill Giant"
						t = rand(1..4)
						case t
						when 1
						puts ""
						 puts "You search through the Giant's bag, and you find a Dagger of unusual balance and lightness."
						 puts "This dagger is surely magical!"
						 #flavor text for +1 sword
						 puts "Do you want to pick it up?"
						 puts ""
						 puts "    Yes  |  No"
						 answer = gets.chomp.downcase
						 case answer
							 when "yes", "y"
						 attacker.update({main_hand:"+1 Dagger"})
						 attacker.character_sheet
							 else
						 end
						when 2 # nothing
							puts ""
							puts "You look through the giant's bag, but all you find is a ball of wax and some string."
						when 3 # +1 sword
							puts ""
							puts "You search through the Giant's bag, and you find a Sword in a scabbard."
							puts "You slowly unsheathe the Sword, and it glows with a magical radiance!"
							#flavor text for +1 sword
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
							attacker.update({main_hand:"+1 Sword"})
							attacker.character_sheet
								else
							end
						when 4 # Plate
							puts ""
							puts "You have bested the Giant in combat!"
							puts "While, searching through his bag you find a smelly but useable suit of Full Plate Armor."
							#replace with Plate Armor
							puts ""
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
									attacker.update({armor:"Full Plate Armor"})
									new_armor_value = Armor.find_by(name:"Full Plate Armor").armor_value
									attacker.update({armor_value:new_armor_value})
									attacker.character_sheet
								else
							end

						end
					elsif defender.name == "Hatchling Dragon"
						t = rand(1..4)
						case t
						when 1, 2 # +1 sword
							puts ""
							puts "There is a treasure chest nearby, and in it you find an extremely ornate Sword in a scabbard."
							puts "You slowly unsheathe the Sword, and it glows with a blinding radiance!"
							#flavor text for +1 sword
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
							attacker.update({main_hand:"+2 Sword"})
							attacker.character_sheet
								else
							end
						when 3 # Plate
							puts ""
							puts "There is a treasure chest nearby, and in it you find a functional suit of Full Plate Armor."
							#replace with Full Plate Armor
							puts ""
							puts "Do you want to pick it up?"
							puts ""
							puts "    Yes  |  No"
							answer = gets.chomp.downcase
							case answer
								when "yes", "y"
									attacker.update({armor:"Full Plate Armor"})
									new_armor_value = Armor.find_by(name:"Full Plate Armor").armor_value
									attacker.update({armor_value:new_armor_value})
									attacker.character_sheet
								else
							end
						when 4 # nothing
							puts ""
							puts "The poor thing's corpse is so mangled, there's nothing to be gleaned from it..."
						end

					end
					attacker.update({status:1})
					exp = attacker.experience_total + defender.exp_value
					attacker.update({experience_total:exp })
					attacker.check_xp
					gold_value = attacker.gold + defender.gold
					attacker.update({gold:gold_value})
				else
					puts "#{attacker.name} lands a crushing blow to your head..."
					defender.update({hit_points:0})
					sleep(2)
					defender.update({status:2})
				end
			end

		end
	def self.fight_animation
		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".green
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".green
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".green
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".green
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".green
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".green
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".green
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".green
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".green
		puts "      ░                                                ".green
		sleep(0.2)

		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".red
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".red
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".red
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".red
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".red
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".red
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".red
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".red
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".red
		puts "      ░                                                ".red
		sleep(0.2)

		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".blue
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".blue
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".blue
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".blue
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".blue
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".blue
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".blue
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".blue
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".blue
		puts "      ░                                                ".blue
		sleep(0.2)

		system("clear")

		20.times { puts ""}
		puts " ▄▄▄▄    ▄▄▄     ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████  ▐██▌ ".white
		puts "▓█████▄ ▒████▄   ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀  ▐██▌ ".white
		puts "▒██▒ ▄██▒██  ▀█▄ ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███    ▐██▌ ".white
		puts "▒██░█▀  ░██▄▄▄▄██░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄  ▓██▒ ".white
		puts "░▓█  ▀█▓ ▓█   ▓██▒ ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒ ▒▄▄  ".white
		puts "░▒▓███▀▒ ▒▒   ▓▒█░ ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░ ░▀▀▒ ".white
		puts "▒░▒   ░   ▒   ▒▒ ░   ░        ░    ░ ░ ▒  ░ ░ ░  ░ ░  ░ ".white
		puts " ░    ░   ░   ▒    ░        ░        ░ ░      ░       ░ ".white
		puts " ░            ░  ░                     ░  ░   ░  ░ ░    ".white
		puts "      ░                                                ".white
		sleep(0.2)
		system("clear")
	end
end
