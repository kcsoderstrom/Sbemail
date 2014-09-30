class Favorite < ActiveRecord::Base
  validate :user_has_access_to_contact

  belongs_to :user
  belongs_to :contact

  private

  def user_has_access_to_contact
    contact = Contact.find(contact_id)
    return if contact.user_id == user_id
    user = User.find(user_id)
    if user.contact_shares.find_by_contact_id(contact_id).nil?
      errors[:base] << "You don't know me!!"
    end
  end

end
