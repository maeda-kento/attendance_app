class AddColumsToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :zipcode, :string
    add_column :staffs, :address, :string
  end
end
