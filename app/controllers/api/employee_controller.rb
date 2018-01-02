class Api::EmployeeController < ApplicationController
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      login!(@employee)
      render :show
    else
      render json: @employee.errors.full_messages, status: 422
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update
      render :show
    else
      render json: @employee.errors.full_messages
    end
  end

  def show
    @emyloyee = Employee.find(params[:id])
    render :show
  end

  def index
    @employees = Employee.all
    render :index
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    render json: {}
  end

  private

    def employee_params
      params.require(:employee).permit(
        :first_name,
        :last_name,
        :username,
        :email,
        :password,
        :departments,
        :tasks,
        :sub_tasks
      )
    end
end
