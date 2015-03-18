class Idea < ActiveRecord::Base
	belongs_to :creator, class_name: 'User'
	has_many :comments
	has_many :votes

end