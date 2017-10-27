class ContactsController < ApplicationController
  before_action :current_user

    def new
      @contact = Contact.new
    end

    def index
      @contacts = List.contacts.all
    end

    def create
      @contact = List.contact.new(contact_params)
      if @contact.save
        redirect_to contacts_path(@contact)
      else
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
