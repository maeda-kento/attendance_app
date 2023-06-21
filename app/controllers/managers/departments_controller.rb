class Managers::DepartmentsController < ApplicationController
  before_action :set_department, only: [:edit, :update, :destroy]


  def index
    @departments = Department.where(params[:department_id]).order(:position)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to managers_departments_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    @department.update(department_params)
  end

  def destroy
    
  end

  def sort
    sort_string = params[:sorted_id]
    sort_array = sort_string.split(",")
    Department.sorted(sort_array)
    head :ok
  end

  private
    def department_params
      params.require(:department).permit(:name, :description)
    end
    
    def set_department
      @department = Department.find(params[:id])
    end
end
