class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id if current_user
    @list.save
    redirect_to '/lists/show'
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
