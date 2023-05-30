module Managers::SessionsHelper

  # 渡されたユーザーでログインする
  def sign_in(manager)
    session[:manager_id] = manager.id
  end
  
  # 現在ログイン中のユーザーを返す (いる場合)
  def current_manager
    if session[:manager_id]
      #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
      @current_manager ||= Manager.find_by(id: session[:manager_id])
    end
  end

  #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_manager?(manager)
    manager == current_manager
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def signed_in?
    !current_manager.nil?
  end

  # 現在のユーザーをログアウトする
  def sign_out
    session.delete(:manager_id)
    @current_manager = nil
  end

end
