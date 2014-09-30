class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    dependent: :destroy

  has_many :contact_shares,
    dependent: :destroy

  has_many :shared_contacts, through: :contact_shares, source: :contact

  has_many :comments, as: :commentable

  has_many :favorites

  has_many :favorite_contacts, through: :favorites, source: :contact

  def all_contacts_hash
    { own_contacts: contacts, shared_contacts: shared_contacts }
  end

  def all_contacts
    all_contacts_hash.values.flatten(1)
  end
end
