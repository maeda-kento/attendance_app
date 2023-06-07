class CreateStaffDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_departments do |t|
      t.references :staff, foreign_key: true
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
