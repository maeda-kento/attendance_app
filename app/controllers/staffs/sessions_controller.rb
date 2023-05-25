class Staffs::SessionsController < ApplicationController
  add_flash_types :success, :info, :warning, :danger

  def new
  end

  def create
    staff = Staff.find_by(email: params[:email].downcase)
    if staff && staff.authenticate(params[:password])
      sign_in staff
      redirect_to staffs_tops_url, notice: "ログインしました"
    else
      flash.now[:alert] = "ログイン失敗しました。"
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to staffs_sign_in_url
  end

end
