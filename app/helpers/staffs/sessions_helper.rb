module Staffs::SessionsHelper
  
  # 渡されたユーザーでログインする
  def sign_in(staff)
    session[:staff_id] = staff.id
  end
  
  # 現在ログイン中のユーザーを返す (いる場合)
  def current_staff
    if session[:staff_id]
      #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
      @current_staff ||= Staff.find_by(id: session[:staff_id])
    end
  end

  #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_staff?(staff)
    staff == current_staff
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def signed_in?
    !current_staff.nil?
  end

  # 現在のユーザーをログアウトする
  def sign_out
    session.delete(:staff_id)
    @current_staff = nil
  end

end
