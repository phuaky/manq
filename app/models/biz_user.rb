class BizUser < ApplicationRecord
  has_many :stores

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

  validates :reg_no,
  presence: true,
  uniqueness: true

  validates :name,
  presence: true,
  uniqueness: true

  validates :address,
  presence: true

  validates :contact_person,
  presence: true

  validates :contact_no,
  presence: true,
  length: {is: 8},
  numericality: {only_integer: true},
  format: {with: /(8|9)\d{7}/, message: "Please enter a valid Singpore mobile number without country code."}
end
