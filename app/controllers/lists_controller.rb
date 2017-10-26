class ListsController < ApplicationController
  before_action :current_user

  def new
    @list = List.new
  end

  def index
    @lists = current_user.lists
  end

  def create
    @list = current_user.lists.create(list_params)
    redirect_to lists_path(@list)
  end

  def show
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path(@list)
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :description)
  end
end
