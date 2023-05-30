class Staffs::AttendancesController < ApplicationController
  before_action :signed_in_staff, only: [:edit, :update, :destroy]
  before_action :set_one_month, only: [:index]

  def index
    @attendances = Attendance.where(staff_id: current_staff.id, worked_on: @one_month).order(:worked_on)
    Attendance.create_one_month(@one_month, current_staff.id) if @attendances.empty?
  end

  def update
    @attendance = Attendance.find(params[:id])
    attribute = if params[:type] == "start"
      :started_at
    elsif params[:type] == "finish"
      :finished_at
    elsif params[:type] == "break_start"
      :break_started_at
    elsif params[:type] == "break_finish"
      :break_finished_at
    end
  @attendance.update({ attribute => Time.current })
  redirect_to staffs_tops_path
  end
end
