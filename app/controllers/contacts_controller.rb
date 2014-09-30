class ContactsController < ApplicationController

  def index
    user = User.find(params[:user_id])

    render json: user.all_contacts_hash
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end


  def show
    contact = Contact.find(params[:id])
    render json: contact
  rescue ActiveRecord::RecordNotFound
    render text: "Ain't there."
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      render json: contact
    else
      render text: "Could not destroy my little black book!"
    end
  rescue ActiveRecord::RecordNotFound
    render text: "Ain't there."
  end

  private
  def contact_params
    params[:contact].permit(:user_id, :name, :email)
  end

end