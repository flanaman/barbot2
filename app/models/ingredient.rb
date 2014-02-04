class Ingredient < ActiveRecord::Base
	has_many :components
	has_many :cocktails, through: :components
end
