class Managers::SessionsController < ApplicationController
  def new
  end

  def create
    staff = Manager.find_by(email: params[:email].downcase)
    if staff && staff.authenticate(params[:password])
      sign_in staff
      redirect_to managers_tops_url, notice: "ログインしました"
    else
      flash.now[:alert] = "ログイン失敗しました。"
      render 'new'
    end
  end
  
end
