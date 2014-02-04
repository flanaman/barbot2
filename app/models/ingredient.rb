class Ingredient < ActiveRecord::Base
	has_many :components
	has_many :cocktails, through: :components
	belongs_to :user
  validates :name, presence: true
	default_scope -> { order('name ASC')} #order ingredient by name
end
