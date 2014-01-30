class Cocktail < ActiveRecord::Base
	belongs_to :user
	has_many :components
	has_many :ingredients, through: :components
	has_many :generics, through: :components
end
