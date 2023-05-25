class ApplicationController < ActionController::Base
  include Staffs::SessionsHelper

  add_flash_types :success, :info, :warning, :danger

  private
  # ログイン済みユーザーかどうか確認
    def signed_in_staff
      unless signed_in?
        redirect_to staffs_sign_in_url
      end
    end

end