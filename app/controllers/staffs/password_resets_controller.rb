class Staffs::PasswordResetsController < ApplicationController

  def new
  end

  def create
    @staff = Staff.find_by(email: params[:email])
    if @staff
      reset_password_token = SecureRandom.urlsafe_base64(8)
      reset_password_token_expires_at = Time.current + 1800
      @staff.update(reset_password_token: reset_password_token, reset_password_token_expires_at: reset_password_token_expires_at)
      StaffMailer.reset_password_email(@staff).deliver
      redirect_to staffs_sign_in_path, success: "パスワード変更メールを送信しました。"
    else
      flash.now[:danger] = "メールアドレスが存在しません。"
      render action: :new
    end
  end

  def edit
    @staff = Staff.find_by(reset_password_token: params[:token])
    if !@staff
      redirect_to staffs_sign_in_path, success: "アクセスできません"
    elsif Time.current > @staff.reset_password_token_expires_at
      redirect_to staffs_sign_in_path, success: "このアクセスは期限切れです。"
    end
  end

  def update
    @staff = Staff.find_by(reset_password_token: params[:token])
    binding.pry
    if @staff && Time.current < @staff.reset_password_token_expires_at
      @staff.update(staff_params.merge(reset_password_token: nil, reset_password_token_expires_at: nil))
      sign_in @staff
      redirect_to staffs_tops_path, success: "パスワードを更新したため自動的にログインしました。"
      
    elsif !@staff
      redirect_to staffs_sign_in_path, success: "アクセスできません"
    
    elsif Time.current > @staff.reset_password_token_expires_at
      redirect_to staffs_sign_in_path, success: "このアクセスは期限切れです。"
    end
  end

  def staff_params
    params.require(:staff).permit(:password, :password_confirmation)
  end
  
end

