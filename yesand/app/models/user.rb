class User < ActiveRecord::Base
	has_many :ideas, foreign_key: :creator_id
	has_many :comments, foreign_key: :author_id
	has_many :votes, foreign_key: :voter_id

	validates :username, :email, :password_hash, presence: true
	validates :username, :email, uniqueness: true
	validates :email, format: {with: /\w+@\w+.\w+/}
end
