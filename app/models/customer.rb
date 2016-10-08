class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one :status


  validates :user_id,
  presence: true
  # Validates that the corresponding user_id exists in TABLE users before allowing the entry to be created
  validates :user,
  presence: true

  validates :store_id,
  presence: true
  # Validates that the corresponding store_id exists in TABLE stores before allowing the entry to be created
  validates :store,
  presence: true

  validates :queue_no,
  presence: true

  validates :status_id,
  presence: true
  # Validates that the corresponding status_id exists in TABLE statuses before allowing the entry to be created
  # validates :status,
  # presence: true
end
