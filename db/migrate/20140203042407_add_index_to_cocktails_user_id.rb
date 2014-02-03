class AddIndexToCocktailsUserId < ActiveRecord::Migration
  def change
    add_index :cocktails, :user_id
  end
end
