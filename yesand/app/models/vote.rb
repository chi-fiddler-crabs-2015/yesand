class Vote < ActiveRecord::Base
	belongs_to :voter, class_name: 'User'
	# POLYMORPHIC STUFF ABOUT BELONGING TO A COMMENT OR IDEA

end