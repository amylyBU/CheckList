class TasksController < ApplicationController
  def index
  end

  def create
    @list = current_list
    @task = Task.new(task_params)
    @task.list_id = @list.id
    if @task.save
      redirect_to list_path(@list)
    else
      flash[:error] = 'Failed to create'
      redirect_to new_list_task_path(@list)
    end
  end

  def show
    @task = current_task
    @list = @task.list
  end

  def new
    @list = current_list
    @task = Task.new
  end

  def update
    @task = current_task
    @list = @task.list
    if @task.update(task_params)
      redirect_to list_path(@list)
    else
      flash[:error] = 'Failed to update'
      redirect_to edit_list_task_path(@list, @task)
    end
  end

  def edit
    @task = current_task
    @list = @task.list
  end

  def destroy
    @task = current_task
    @list = @task.list
    @task.destroy
    redirect_to list_path(@list)
  end

  def update_completion
    @complete_task_ids = params[:task_ids]
    @all_task_ids = current_list.task_ids

    if @complete_task_ids != nil
      @complete_task_ids = @complete_task_ids.map(&:to_i)
      Task.where(id: @complete_task_ids).update_all(complete: true)
      @incomplete_task_ids = @all_task_ids - @complete_task_ids
      Task.where(id: @incomplete_task_ids).update_all(complete: false)
    else
      Task.where(id: @all_task_ids).update_all(complete: false)
    end

    redirect_to list_path(current_list)
  end

  private

  def current_task
    Task.find(params[:id])
  end

  def current_list
    List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end
