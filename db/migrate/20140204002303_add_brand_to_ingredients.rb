class AddBrandToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :brand, :string
  end
end
