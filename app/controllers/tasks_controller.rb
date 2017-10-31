class TasksController < ApplicationController
  def index
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_params)
    @task.list_id = @list.id
    @task.save
    redirect_to list_path(@list)
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def update
    @task = find_current_task
    @task.save
  end

  def destroy
    @task = find_current_task
    @list = List.find(@task.list_id)
    @task.destroy
    redirect_to list_path(@list)
  end

  private

  def find_current_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
