class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :hourly_pay, null: false, default: 0
      t.date :birthed_on, null: false
      t.integer :gender, null: false, default: 0

      t.timestamps
    end
    add_index :staffs, :email, unique: true
  end
end
