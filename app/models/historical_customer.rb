class HistoricalCustomer < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_one :status
end
