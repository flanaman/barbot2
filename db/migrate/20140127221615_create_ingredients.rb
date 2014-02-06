class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :description
      t.integer :proof
      t.integer :rating

      t.timestamps
    end
  end
end
