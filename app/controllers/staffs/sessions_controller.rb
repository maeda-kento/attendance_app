class Staffs::SessionsController < ApplicationController

  def new
  end

  def create
    staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff && staff.authenticate(params[:session][:password])
      sign_in staff
      redirect_to staffs_tops_url
    else
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to staffs_sign_in_url
  end

end
