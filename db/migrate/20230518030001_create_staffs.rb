class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.references :department, foreign_key: true, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :hourly_pay, null: false, default: 0
      t.date :birthed_on, null: false

      t.timestamps
    end
    add_index :staffs, :email, unique: true
  end
end
