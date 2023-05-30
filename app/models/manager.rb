class Manager < ApplicationRecord

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :password, format:{ with: VALID_PASSWORD_REGEX }, length: { minimum: 8, maximum: 12 }, allow_blank: true
  validates :email, format:{ with: VALID_EMAIL_REGEX }, presence: true, uniqueness: true
end
