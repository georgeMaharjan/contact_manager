# app/controllers/contacts_controller.rb
class ContactsController < ApplicationController
  before_action :set_contact, only: [ :show, :edit, :update, :destroy ]

  def index
    @contacts = Contact.all
    @contacts = @contacts.search_by_term(params[:query]) if params[:query].present?
    @contacts = @contacts.page(params[:page]).per(8)

    respond_to do |format|
      format.html
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact was successfully created."
      redirect_to contacts_path
    else
      flash[:danger] = @contact.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact was successfully updated."
      redirect_to contacts_path
    else
      flash[:danger] = @contact.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @contact.destroy
      flash[:success] = "Contact was successfully deleted."
    else
      flash[:danger] = "Failed to delete contact."
    end
    redirect_to contacts_path
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :middle_name, :phone, :email, :address)
  end
end
