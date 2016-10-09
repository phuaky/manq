class RegisteredUser < ApplicationRecord
  has_one :biz_user
  belongs_to :user_type

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

  validates :user_type_id,
  presence: true
  # Validates that the corresponding user_type_id exists in TABLE uesr_types before allowing the entry to be created
  validates :user_type,
  presence: true

  def self.authenticate(params)
    RegisteredUser.find_by_email(params[:email]).try(:authenticate, params[:password])
  end
end
