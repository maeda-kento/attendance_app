class Department < ApplicationRecord
  has_many :staffs, foreign_key: "department_id"

  validates :name, presence: true, length: { maximum: 10 }
end
