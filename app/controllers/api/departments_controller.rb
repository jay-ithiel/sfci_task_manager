class Api::DepartmentsController < ApplicationController
  def create
    @department = Department.new(department_params)
    if @department.save
      render :show
    else
      render json: @department.errors.full_messages, status: 422
    end
  end

  def update
    @department = Department.find(params[:id])
    if @department.update
      render :show
    else
      render json: @department.errors.full_messages
    end
  end

  def show
    @department = Department.find(params[:id])
    render :show
  end

  def index
    @departments = Departments.all
    render :index
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    render json: {}
  end

  private

    def department_params
      params.require(:department).permit(
        :name,
        :employees,
        :tasks,
        :sub_tasks
      )
    end
end
