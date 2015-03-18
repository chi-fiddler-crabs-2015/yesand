class Comment < ActiveRecord::Base
	belongs_to :author, class_name: 'User'
	has_many :votes
	# POLYMORPHIC STUFF HERE ABOUT VOTES
	# POLYMORPHIC STUFF HERE ABOUT COMMENTS


end