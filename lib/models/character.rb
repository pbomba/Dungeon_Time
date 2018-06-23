class Character < ActiveRecord::Base
	belongs_to :player
	belongs_to :game
	has_one :character_sheet
	has_many :weapons
	# has_many :battles

	def self.character_setup(player)
		puts "Enter a character name"
		name1 = gets.chomp
		current_character = Character.create(name:name1, player_id: player.id)
		sleep(1)
		puts ""
		puts "Press ENTER to roll 3d6 for strength"
  		gets
		sleep(1)
			# strength
		str_total = current_character.roll_attributes
		current_character.update({strength: str_total})
		str_bonus = current_character.attribute_bonus(str_total)
		sleep(1)
		puts ""
		puts "Press ENTER to roll 3d6 for dexterity"
		gets
		sleep(1)
			# dexterity
		dex_total = current_character.roll_attributes
		current_character.update({dexterity: dex_total})
		dex_bonus = current_character.attribute_bonus(dex_total)
		sleep(1)
			# constitution
		puts ""
		puts "Press ENTER to roll 3d6 for constitution"
		gets
		sleep(1)
		con_total = current_character.roll_attributes
		current_character.update({constitution: con_total})
		con_bonus = current_character.attribute_bonus(con_total)
			# hit points
		puts ""
		puts "Press ENTER to roll 1d8 for hit points"
		gets
		sleep(1)
		base_hp = current_character.roll_hit_points
		hit_points = current_character.calculate_hit_points(con_bonus, base_hp)
		hit_points < 1 ? hit_points = 1 : hit_points
		sleep(1)
		puts ""
		puts "#{name1} has #{hit_points} HP (adjusted by #{con_total} Constitution)"
		puts ""

		current_character.update({hit_points: hit_points})
		current_character.update({max_hp: hit_points})
		current_character.update({status: 0})
		current_character.character_sheet
		current_character

	end



	def roll_attributes
		tot = rand(6) + 1
		tot += rand(6) + 1
		tot += rand(6) +1
		puts tot
		tot
	end

	def roll_hit_points
		tot = rand(8)+1
		puts tot
		tot
	end

	def attribute_bonus(attribute)
		if attribute >= 18
			bonus = 4
		elsif attribute >= 16
			bonus = 3
		elsif attribute >= 14
			bonus = 2
		elsif attribute >= 12
			bonus = 1
		elsif attribute >= 10
			bonus = 0
		elsif attribute >= 8
			bonus = -1
		elsif attribute >= 6
			bonus = -2
		elsif attribute >= 4
			bonus = -3
		else
			bonus = -4
		end
		bonus
	end

	def calculate_hit_points(bonus, base_hp)
		hp = base_hp + bonus
		hp
	end

	def calculate_total_armor_bonus
		tab = self.attribute_bonus(self.dexterity) + Armor.find_by(name:self.armor).armor_value
		self.update({armor_value:tab})
		tab
	end


	def calculate_armor_class(total_armor_bonus)
		ac = 10 - total_armor_bonus
		ac
	end


	def check_xp

		xp = self.experience_total

		case xp
		when 0..10
			newlvl = 1
		when 11..20
			newlvl = 2
		when 21..40
			newlvl = 3
		when 41..80
			newlvl = 4
		else
			newlvl = 5
		end

		if self.level < newlvl
			self.level_up
		else
		end
	end

	def level_up
		puts ""
		puts "Congratulations, you've gained a level!"
		puts ""
		old_hit_points = self.max_hp
		puts "press ENTER to roll 1d8 for hit points"
		gets
		added_hp = self.roll_hit_points + attribute_bonus(self.constitution)
		new_hp = old_hit_points + added_hp
		self.update({max_hp:new_hp})
		new_lvl = self.level + 1
		self.update({level:new_lvl})
		self.improve_attribute


	end

	def improve_attribute
		puts ""
		puts "Choose an attribute to improve"
		puts ""
		puts "    Strength  |  Dexterity  |  Constitution"
		answer = gets.chomp.downcase

		case answer
				when "strength", "str", "s"
					str = self.strength + 1
					self.update({strength:str})
				when "dexterity", "dex", "d"
					dex = self.dexterity + 1
					self.update({dexterity:dex})
				when "constitution", "con", "c"
					con = self.constitution + 1
					self.update({constitution:con})
					if con%2 == 0
							new_max_hp = self.max_hp + self.level
							self.update({max_hp:new_max_hp})
					else
					end
				when "charisma", "intelligence", "wisdom"
				puts "No, you don't get to do that in a HACK and SLASH like Dungeon Time™!"
				else
		end
	end


	def character_sheet
		level = self.level
		hp = self.hit_points
		max_hp = self.max_hp
		hp_length = 34 - "#{hp} / #{max_hp}".length
		str_total = self.strength
		str_bonus = attribute_bonus(str_total)
		dex_total = self.dexterity
		dex_bonus = attribute_bonus(dex_total)
		con_total = self.constitution
		con_bonus = attribute_bonus(con_total)
		xp = self.experience_total
		xp_length = 28 - (xp.to_s.length)
		name1 = self.name
		name_length = 40 - (name.length)
		total_armor_bonus = self.calculate_total_armor_bonus
		armor_class = calculate_armor_class(total_armor_bonus)
		weapon = self.main_hand
		weapon_length = 32 - (self.main_hand.to_s.length)
		armor = self.armor
		armor_length = 33 - (self.armor.to_s.length)
		gp = self.gold
		gp_length = 34 - (gp.to_s.length)

		puts ""
		puts "   ~~~~~~~~~ CHARACTER SHEET ~~~~~~~~~~~"
		puts "____________________________________________"
		puts "|                                          |"
		print "|  #{name1}"
		name_length.times { print " "}
		puts "|"
		puts "|                                          |"
		puts "| LEVEL : #{level}                                |"
		puts "|                                          |"
		print "| HP :  #{hp} / #{max_hp}"
		hp_length.times { print " " }
		puts "|"
		puts "|                                          |"
		print "| ARMOR CLASS : #{armor_class}"
		if armor_class > 9
			puts"                         |"
		else
			puts"                          |"
		end
		puts "|                                          |"
		puts "| STR #{str_total}  : #{str_bonus}                              |"
		puts "|                                          |"
		puts "| DEX #{dex_total}  : #{dex_bonus}                              |"
		puts "|                                          |"
		puts "| CON #{con_total}  : #{con_bonus}                              |"
		puts "|                                          |"
		print "| WEAPON : #{weapon}"
		weapon_length.times { print " "}
		puts "|"
		puts "|                                          |"
		print "| ARMOR : #{armor}"
		armor_length.times { print " " }
		puts "|"
		puts "|                                          |"
		print "| EXPERIENCE : #{xp}"
		xp_length.times { print " "}
		puts "|"
		print "| GOLD : #{gp}"
		gp_length.times { print " "}
		puts "|"
		puts "|                                          |"
		puts "____________________________________________"

	end
end
