class Store < ApplicationRecord
  belongs_to :biz_user
  has_many :customers
  has_many :historical_customers
  has_many :users, through: :customers
  has_many :users, through: :historical_customers
end
