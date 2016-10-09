class CreateBizUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :biz_users do |t|
      t.integer :registered_user_id
      t.string :reg_no
      t.string :company_name
      t.text :address
      t.string :contact_person
      t.integer :contact_no

      t.timestamps
    end
  end
end
