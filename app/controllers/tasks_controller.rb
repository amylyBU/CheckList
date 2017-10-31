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
    @task = Task.find(params[:id])
    @task.save
  end

  def destroy
    @task = Task.find(params[:id])
    @list = @task.list_id
    @task.destroy
    redirect_to list_path(@list)
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
