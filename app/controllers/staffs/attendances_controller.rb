class Staffs::AttendancesController < ApplicationController
  before_action :signed_in_staff, only: [:edit, :update, :destroy]
  before_action :set_one_month, only: [:index]

  def index
    @attendances = Attendance.where(staff_id: current_staff.id, worked_on: @one_month).order(:worked_on)
  end

  def set_one_month
    @one_month = params[:date].nil? ? Date.current.all_month : params[:date].to_date.all_month
  end
end
