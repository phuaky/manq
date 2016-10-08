class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :email
      t.string :password_digest
      t.text :name
      t.text :address
      t.integer :contact_no
      t.string :contact_person
      t.integer :biz_user_id
      t.integer :max_queue_no
      t.integer :max_queue_allow
      t.float :reservation_fee
      t.integer :max_leeway

      t.timestamps
    end
  end
end
