class Staff < ApplicationRecord
  belongs_to :department

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  enum gender: { male: 1, female: 2, other: 0 }
  

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :password, format:{ with: VALID_PASSWORD_REGEX }, presence: true, length: { minimum: 8, maximum: 12 }
  validates :hourly_pay, presence: true, length: { maximum: 9999 }
  validates :email, format:{ with: VALID_EMAIL_REGEX }, presence: true
  validates :gender, inclusion: { in: Staff.genders.keys }
end
