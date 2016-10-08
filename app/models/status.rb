class Status < ApplicationRecord
  belongs_to :customers
  belongs_to :historical_customers

  validates :status_type,
  uniqueness: {case_sensitive: false},
  presence: true
end
