class CreateBizUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :biz_users do |t|
      t.string :email
      t.string :password_digest
      t.string :reg_no
      t.string :name
      t.text :address
      t.integer :contact_no
      t.string :contact_person

      t.timestamps
    end
  end
end
