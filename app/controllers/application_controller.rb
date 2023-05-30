class ApplicationController < ActionController::Base
  include Staffs::SessionsHelper

  add_flash_types :success, :info, :warning, :danger

  def set_one_month
    @one_month = params[:date].nil? ? Date.current.all_month : params[:date].to_date.all_month
  end

  private
  # ログイン済みユーザーかどうか確認
    def signed_in_staff
      unless signed_in?
        redirect_to staffs_sign_in_url
      end
    end
end