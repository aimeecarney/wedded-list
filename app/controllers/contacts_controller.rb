class ContactsController < ApplicationController

    def new
      @contact = Contact.new
    end

    def index
      @contacts = Contact.all
    end

    def create
      @contact = current_user.contacts.create(contact_params)
      redirect_to '/contacts/index'
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
      params.require(:contact).permit(:name, :address, :phone_number, :email, :plus_one_name)
    end

end
