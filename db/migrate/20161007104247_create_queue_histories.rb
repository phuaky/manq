class CreateQueueHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :queue_histories do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :queue_no
      t.integer :status_id
      t.timestamp :created_at

      t.timestamps
    end
  end
end
