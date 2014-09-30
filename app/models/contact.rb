class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates_uniqueness_of :email, scope: :user_id

  belongs_to :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  has_many :contact_shares, dependent: :destroy
  has_many :shared_users, through: :contact_shares, source: :user
  has_many :comments, as: :commentable
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :user
end
