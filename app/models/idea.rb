class Idea < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :description, :creator, presence: true
  validates :title, uniqueness: true

  validates_length_of :title, :maximum => 120, message: "should more succinct here, add the rest to your description!"
  validates_length_of :title, :minimum => 10, message: "needs to be something that describes your idea"

  validates_length_of :description, :minimum => 10, message: "needs more OOOMPH to share your idea"



end
