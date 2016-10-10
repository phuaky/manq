class AddCompositeIndexToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_index :customers, [:user_id, :store_id], unique: true
  end
end
