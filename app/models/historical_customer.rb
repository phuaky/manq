class HistoricalCustomer < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one :status

  validates :user_id,
  presence: true

  validates :store_id,
  presence: true

  validates :queue_no,
  presence: true

  validates :status_id,
  presence: true

  validates :time,
  presence: true
end
