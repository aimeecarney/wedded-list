class ListsController < ApplicationController
  before_action :current_user
  before_action :set_list, only: [:show, :edit, :update, :destroy, :add_contact, :local_contacts]

  def new
    @list = List.new
  end

  def index
    @lists = current_user.lists
  end

  def create
    @list = current_user.lists.new(list_params)
      if @list.save
        flash[:notice] = "List successfully created"
        redirect_to lists_path(@list)
      else
        render :new
      end
  end

  def show
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def add_contact
    @contacts = Contact.where(user_id: current_user.id)
    @contact = Contact.new
  end

  def local_contacts
    @contacts = Contact.where(user_id: current_user.id, state: @list.state)
  end

  def edit
  end

  def destroy
    @list.destroy
    redirect_to lists_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :date, :street, :city, :state, :description, contact_ids:[])
  end

end
