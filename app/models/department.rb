class Department < ApplicationRecord
  has_many :staff_departments, dependent: :restrict_with_error
  has_many :staffs, through: :staff_departments

  acts_as_list

  validates :name, presence: true, length: { maximum: 10 }

  def self.sorted(sort_array)
    transaction do
      sort_array.each.with_index(1) do |a, index|
        find(a).update(position: index)
      end
    end
  end

end
