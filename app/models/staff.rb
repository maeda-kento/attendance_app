class Staff < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :staff_departments
  has_many :departments, through: :staff_departments

  has_one_attached :image

  has_secure_password

  attr_accessor :start, :finish, :break_finish, :break_start

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  enum gender: { male: 1, female: 2, other: 0 }
  

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :password, format:{ with: VALID_PASSWORD_REGEX }, length: { minimum: 8, maximum: 12 }, allow_blank: true, on: :update
  validates :hourly_pay, presence: true, length: { minimum: 0, maximum: 9999 }
  validates :email, format:{ with: VALID_EMAIL_REGEX }, presence: true, uniqueness: true
  validates :gender, inclusion: { in: Staff.genders.keys }
  validates :reset_password_token, presence: true, uniqueness: true, allow_blank: true


  def age
    date_format = "%Y%m%d"
    (Date.current.strftime(date_format).to_i - birthed_on.strftime(date_format).to_i) / 10000
  end

end
