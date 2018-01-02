class Api::SubTasksController < ApplicationController
  def create
    @sub_task = SubTask.new(sub_task_params)
    if @sub_task.save
      render :show
    else
      render json: @sub_task.errors.fulL_messages, status: 422
    end
  end

  def update
    @sub_task = SubTask.new(sub_task_params)
    if @sub_task.save
      render :show
    else
      render json: @sub_task.errors.fulL_messages, status: 422
    end
  end

  def show
    @sub_task = SubTask.find(params[:id])
    render :show
  end

  def index
    @sub_tasks = SubTask.all
    render :index
  end

  def destroy
    @sub_task = SubTask.find(params[:id])
    @sub_task.destroy
    render json: {}
  end

  private

    def sub_task_params
      params.require(:sub_task).permit(
        :name,
        :description,
        :assignee_id,
        :assigner_id,
        :due_date,
        :departments,
        :task,
        :assignee,
        :assigner
      )
    end
end
