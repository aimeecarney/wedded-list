class ContactsController < ApplicationController
  before_action :current_user
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

    def new
      @contact = Contact.new
    end

    def index
      @contacts = Contact.where(user_id: current_user.id)
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.user_id = current_user.id
      if @contact.save
        flash[:notice] = "Contact successfully created"
        redirect_to contacts_path(@contact)
      else
        render :new
      end
    end


    def show
    end

    def update
      @contact.update(contact_params)
      redirect_to contacts_path(@contact)
    end

    def edit
    end

    def destroy
      @contact.destroy
      redirect_to contacts_path(@contact)
    end

    private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :street, :city, :state, :email, :plus_one_name, :list_id)
    end

end
