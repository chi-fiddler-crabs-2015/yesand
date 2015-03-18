class Idea < ActiveRecord::Base
	belongs_to :creator, class_name: 'User'
	has_many :comments, as: :commentable
	has_many :votes, as: :votable

  validates :title, :description, presence: true
  validates :title, uniqueness: true

  validates_length_of :title, :maximum => 120
  validates_length_of :title, :minimum => 10

  validates_length_of :description, :minimum => 10

end
