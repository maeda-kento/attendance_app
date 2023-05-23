class Staffs::RegistrationsController < ApplicationController
  before_action :signed_in_staff, only: [:edit, :update, :destroy]

  def show
    @department = Department.find_by(id: current_staff.department_id)
  end

  def edit
    
  end

  def update
    
  end
end
