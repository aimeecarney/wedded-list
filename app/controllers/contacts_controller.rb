class ContactsController < ApplicationController
  before_action :current_user

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
        redirect_to contacts_path(@contact)
      else
        flash[:notice] = "Sorry, something went wrong."
        redirect_to new_contacts_path
      end
    end


    def show
      @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      @contact.update(contact_params)
      redirect_to contacts_path(@contact)
    end

    def edit
      @contact = Contact.find(params[:id])
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to contacts_path(@contact)
    end

    private

    def contact_params
      params.require(:contact).permit(:name, :street, :city, :state, :email, :plus_one_name)
    end

end
