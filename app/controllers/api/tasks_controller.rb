class Api::TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      render :show
    else
      render json: @task.errors.fulL_messages, status: 422
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update
      render :show
    else
      render json: @task.errors.full_messages, status: 422
    end
  end

  def show
    @task = Task.find(params[:id])
    render :show
  end

  def index
    @tasks = Task.all
    render :index
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render json: {}
  end

  private

    def task_params
      params.require(:task).permit(
        :name,
        :description,
        :assignee_id,
        :assigner_id,
        :due_date,
        :sub_tasks,
        :departments
        :assigner,
        :assignee
      )
    end
end
