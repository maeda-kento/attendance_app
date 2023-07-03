class Managers::SidebarsController < ApplicationController

  def update
    if session[:sidebar] == "open"
      params[:sidebar_status] = "close"
      session[:sidebar] = params[:sidebar_status]
    else
      params[:sidebar_status] = "open"
      session[:sidebar] = params[:sidebar_status]
    end
  end

end
