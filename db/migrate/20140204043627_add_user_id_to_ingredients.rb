class AddUserIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :user_id, :integer
    add_index :ingredients, :user_id
  end
end
