class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :amount
      t.integer :ingredient_id
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
