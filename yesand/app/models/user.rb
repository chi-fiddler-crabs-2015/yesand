class User < ActiveRecord::Base
	has_many :ideas, foreign_key: :creator_id
	has_many :comments, foreign_key: :author_id
	has_many :votes, foreign_key: :voter_id

end