class CreateQs < ActiveRecord::Migration[5.0]
  def change
    create_table :qs do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :queue_no
      t.integer :status_id

      t.timestamps
    end
  end
end
