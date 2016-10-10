class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.integer :registered_user_id
      t.integer :biz_user_id
      t.string :store_name
      t.string :store_address
      t.integer :contact_no
      t.string :contact_person
      t.integer :max_queue_no
      t.integer :max_queue_allow
      t.integer :max_leeway
      t.float :reservation_fee

      t.timestamps
    end
  end
end
