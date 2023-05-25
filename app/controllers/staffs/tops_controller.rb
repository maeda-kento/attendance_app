class Staffs::TopsController < ApplicationController
  before_action :signed_in_staff, only:[:edit, :update, :destroy, :index]
  

  def index
    @attendance = current_staff.attendances.find_by(worked_on: Date.today)
  end

end
