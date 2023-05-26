class Managers::StaffsController < ApplicationController
  
  def index
    @staffs = Staff.all.includes(:department)
  end
end
