class Status < ApplicationRecord
  has_many :customers
  has_many :historical_customers

  validates :status_type,
  uniqueness: {case_sensitive: false},
  presence: true
end
