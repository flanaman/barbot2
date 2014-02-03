class AddIndexToComponentsCocktailIdAndGenericIdAndIngredientId < ActiveRecord::Migration
  def change
  	add_index :components, :cocktail_id
  	add_index :components, :generic_id
  	add_index :components, :ingredient_id
  end
end
