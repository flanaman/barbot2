class RemoveGenericIdFromComponents < ActiveRecord::Migration
  def change
    remove_index :components, :generic_id
    remove_column :components, :generic_id, :integer
  end
end
