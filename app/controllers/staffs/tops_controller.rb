class Staffs::TopsController < ApplicationController
  before_action :signed_in_staff, only:[:edit, :update, :destroy]

  def index
    
  end
end
