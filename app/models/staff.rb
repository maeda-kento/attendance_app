class Staff < ApplicationRecord
  belongs_to :department

  has_secure_password

end
