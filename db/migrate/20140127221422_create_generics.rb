class CreateGenerics < ActiveRecord::Migration
  def change
    create_table :generics do |t|
      t.string :name
      t.integer :proof
      t.string :category

      t.timestamps
    end
  end
end
