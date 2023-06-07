class Staffs::RegistrationsController < ApplicationController
  before_action :signed_in_staff, only:[:edit, :update, :destroy, :index]
  add_flash_types :success, :info, :warning, :danger

  def show
    
  end

  def edit
    
  end

  def update
    if current_staff.update(staff_params)
      
      redirect_to staffs_registrations_path, success: "アカウントを更新しました"
    else
      
      flash.now[:danger] = "アカウントの更新に失敗しました。"
      render action: :edit
    end
  end

  def staff_params
    params.require(:staff).permit(:last_name, :first_name, :email, :birthed_on, :gender, :hourly_pay, :image, department_ids: [])
  end

end
