class Cocktail < ActiveRecord::Base
	belongs_to :user
  validates :user_id, presence: true
	has_many :components
	has_many :ingredients, through: :components
	has_many :generics, through: :components
	default_scope -> { order('rating DESC')} #order cocktail by rating
end
