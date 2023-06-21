class AddColumnToDepartmentPosition < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :position, :integer
  end
end
