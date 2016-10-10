class BizUser < ApplicationRecord
  has_many :stores, dependent: :destroy
  belongs_to :registered_user

  validates :registered_user_id,
  presence: true,
  uniqueness: true
  # Validates that the corresponding registered_user_id exists in TABLE registered_users before allowing the entry to be created
  validates :registered_user,
  presence: true

  validates :reg_no,
  presence: true,
  uniqueness: true

  validates :company_name,
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
