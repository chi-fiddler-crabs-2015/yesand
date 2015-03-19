class Comment < ActiveRecord::Base
	belongs_to :author, class_name: 'User'
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
	has_many :votes, as: :votable

  validates :text, :author, :commentable, presence: true

end
