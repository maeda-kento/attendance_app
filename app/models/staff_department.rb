class StaffDepartment < ApplicationRecord
  belongs_to :staff
  belongs_to :department
end
