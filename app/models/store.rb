class Store < ApplicationRecord
  belongs_to :biz_user
  has_many :customers
  has_many :historical_customers
  has_many :users, through: :customers
  has_many :users, through: :historical_customers

  validates :registered_user_id,
  presence: true

  validates :biz_user_id,
  presence: true

  validates :store_name,
  presence: true

  validates :store_address,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :contact_person,
  presence: true

  validates :contact_no,
  presence: true,
  length: {is: 8},
  numericality: {only_integer: true},
  format: {with: /(8|9)\d{7}/, message: "Please enter a valid Singpore mobile number without country code."}

  validates :max_queue_no,
  presence: true

  validates :max_queue_allow,
  presence: true

  validates :max_leeway,
  presence: true

  validates :reservation_fee,
  presence: true
end
