class Ingredient < ActiveRecord::Base
	has_many :components
	has_many :cocktails, through: :components
	belongs_to :user

  validates :name, presence: true
  validates :proof, numericality: {greater_than_or_equal_to: 0,
  																less_than_or_equal_to: 200},
  																unless: "proof.nil?"
  validates :rating, numericality: {greater_than_or_equal_to: 0,
  																less_than_or_equal_to: 5},
  																unless: "rating.nil?"
	default_scope -> { order('name ASC')} #order ingredient by name
end
