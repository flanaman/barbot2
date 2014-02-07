class Component < ActiveRecord::Base
	belongs_to :cocktail
	belongs_to :ingredient
	validates :cocktail, presence: true
end
