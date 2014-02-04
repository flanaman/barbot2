class RemoveGenericIdFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :generic_id, :integer
  end
end
