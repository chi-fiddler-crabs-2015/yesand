class User < ActiveRecord::Base
	has_many :ideas, foreign_key: :creator_id
	has_many :comments, foreign_key: :author_id
	has_many :votes, foreign_key: :voter_id

	validates :username, :email, :password_hash, presence: true

	validates :username, :email, uniqueness: true
	validates :email, format: {with: /\w+@\w+.\w+/}

  def password
    @_password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(plaintext)
    @_password = BCrypt::Password.create(plaintext)
    self.password_hash = @_password
  end
end
