class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  def edit
    @list = find_current_list
  end

  def show
    @list = find_current_list
  end

  def update
    @list = find_current_list
    if @list.update(list_params)
      redirect_to list_path(find_current_list)
    else
      render :update
    end
  end

  def destroy
    @list = find_current_list
    @list.destroy
    redirect_to root_path
  end

  private

  def find_current_list
    List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
