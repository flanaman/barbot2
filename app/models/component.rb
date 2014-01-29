class Component < ActiveRecord::Base
	belongs_to :cocktail
	belongs_to :generic
	belongs_to :ingredient
end
