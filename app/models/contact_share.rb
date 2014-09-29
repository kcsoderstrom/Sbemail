class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validates_uniqueness_of :contact_id, scope: :user_id

  belongs_to :user
  belongs_to :contact
end
