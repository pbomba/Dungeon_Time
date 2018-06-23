class Weapon < ActiveRecord::Base
	belongs_to :character
	belongs_to :monster
end