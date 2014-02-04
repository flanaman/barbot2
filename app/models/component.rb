class Component < ActiveRecord::Base
	belongs_to :cocktail
	belongs_to :generic
	belongs_to :ingredient
	validates :cocktail_id, presence: true
	attr_accesible :name

	def name
  	unless self.ingredients.nil?
      self.ingredient.name
    else
      self.generic.name
    end
  end
end
