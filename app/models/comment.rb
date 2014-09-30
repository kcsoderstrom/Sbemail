class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  validates :body, :commentable_id, :commentable_type, presence: true

  belongs_to :author,
    class_name: "User"
end
