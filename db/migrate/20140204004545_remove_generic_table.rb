class RemoveGenericTable < ActiveRecord::Migration
  def change
  	drop_table :generics
  end
end
