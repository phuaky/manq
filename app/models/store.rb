class Store < ApplicationRecord
  belongs_to :biz_user
  has_many :customers
  has_many :historical_customers
  has_many :users, through: :customers
  has_many :users, through: :historical_customers

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})/, message: "Please enter a valid email"}

  validates :password,
  confirmation: true,
  length: { in: 8..72 },
  on: :create

  validates :password_confirmation,
  length: { in: 8..72 },
  presence: true,
  on: :create

  has_secure_password

  validates :name,
  presence: true

  validates :address,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :contact_person,
  presence: true

  validates :contact_no,
  presence: true,
  length: {is: 8},
  numericality: {only_integer: true},
  format: {with: /(8|9)\d{7}/, message: "Please enter a valid Singpore mobile number without country code."}

  validates :biz_user_id,
  presence: true

  validates :max_queue_no,
  presence: true

  validates :max_queue_allow,
  presence: true

  validates :reservation_fee,
  presence: true

  validates :max_leeway,
  presence: true
end
