class Generic < ActiveRecord::Base
	has_many :ingredients
	has_many :components
	has_many :cocktails, through: :components
end
