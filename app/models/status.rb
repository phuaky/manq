class Status < ApplicationRecord
  belongs_to :customer
  belongs_to :historical_customers
end
