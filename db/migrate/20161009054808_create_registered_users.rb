class CreateRegisteredUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :registered_users do |t|
      t.string :email
      t.string :password_digest
      t.integer :user_type_id

      t.timestamps
    end
  end
end
