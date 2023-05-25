class Department < ApplicationRecord
  has_many :staffs

  validates :name, presence: true, length: { maximum: 10 }
end
