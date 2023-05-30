class Managers::Staffs::AttendancesController < ApplicationController
  before_action :set_one_month, only: [:index, :edit_one_month]
  before_action :control_one_month, only: [:index, :edit_one_month]
  
  def index
    
  end

  def edit_one_month
    
  end

  def update_one_month
    attendances_params.each do |id, attr|
      u_atten = Attendance.find(id)
      u_atten.update(attr)
    end
    redirect_to managers_staff_attendances_path
  end

  def control_one_month
    @staff = Staff.find(params[:staff_id])
    @attendances = @staff.attendances.where(worked_on: @one_month).order(:worked_on)
    Attendance.create_one_month(@one_month, @staff.id) if @attendances.empty?
  end

  def attendances_params
    params.require(:staff).permit(attendances: [:started_at, :break_started_at, :break_finished_at, :finished_at])[:attendances]
  end
end
