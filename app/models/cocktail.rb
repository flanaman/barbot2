class Cocktail < ActiveRecord::Base
	belongs_to :user
	has_many :components, dependent: :destroy
	has_many :ingredients, through: :components

	accepts_nested_attributes_for :components, 
		reject_if: lambda { |a| a[:amount].blank? }, allow_destroy: true

  validates :user_id, presence: true
  validates :name, presence: true
  validates :rating, numericality: {greater_than_or_equal_to: 0,
  																less_than_or_equal_to: 5},
  																unless: "rating.nil?"
	default_scope -> { order('rating DESC')} #order cocktail by rating
end
