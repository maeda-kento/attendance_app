class Staffs::RegistrationsController < ApplicationController
  before_action :signed_in_staff, only: [:edit, :update, :destroy]

  def show
    current_staff
  end

  def edit
    
  end

  def update
    
  end
end
