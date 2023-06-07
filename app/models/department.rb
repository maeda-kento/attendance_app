class Department < ApplicationRecord
  has_many :staff_departments
  has_many :staffs, through: :staff_departments

  validates :name, presence: true, length: { maximum: 10 }
end
