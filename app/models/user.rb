class User < ApplicationRecord
  has_many :customers
  has_many :historical_customers
  has_many :stores, through: :customers
  has_many :stores, through: :historical_customers

  validates :phone_no,
  presence: true,
  length: {is: 8},
  numericality: {only_integer: true},
  uniqueness: true,
  format: {with: /(8|9)\d{7}/, message: "Please enter a valid Singpore mobile number without country code."}
end
