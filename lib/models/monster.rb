class Monster < ActiveRecord::Base
	# has_many :battles
	has_one :weapon


	def self.roll_hit_points(current_monster)
		i = 0
		tot = 0
		while i < current_monster.hit_dice do
			roll = (rand(8)+1) + Monster.attribute_bonus(current_monster.constitution)
			roll < 1 ? roll = 1 : roll
			tot += roll
			i += 1
		end
		tot
	end

	def self.generate_monster(monster_type)
		current_monster = Monster.find_by(name:monster_type)
		m_hp = Monster.roll_hit_points(current_monster)
		current_monster.update({hit_points: m_hp })
		current_monster
		# hit_points = current_monster.calculate_hit_points(con_bonus, base_hp)
		# hit_points < 1 ? hit_points = 1 : hit_points
	end

	def self.attribute_bonus(attribute)
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

end
