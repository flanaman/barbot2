class Ingredient < ActiveRecord::Base
	belongs_to :generic
	has_many :components
	has_many :cocktails, through: :components
end
