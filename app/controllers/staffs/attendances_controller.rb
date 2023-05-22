class Staffs::AttendancesController < ApplicationController
  before_action :signed_in_staff, only:[:edit, :update, :destroy]

  def index
    @attendances = Attendance.where(staff_id: current_staff.id, worked_on: Date.current.all_month).order(:worked_on)

  end
end
