class User < ActiveRecord::Base
	has_many :ideas, foreign_key: :creator_id
	has_many :comments, foreign_key: :author_id
	has_many :votes, foreign_key: :voter_id

	validates :username, :password_hash, presence: true

	validates :username, :email, uniqueness: { case_sensitive: false }
	validates :email, format: {with: /\w+@\w+.\w+/}

  def password
    @_password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(plaintext)
    @_password = BCrypt::Password.create(plaintext)
    self.password_hash = @_password
  end

  def self.authenticate(user)
    @_user = User.find_by(username: user[:username])
    @_user if @_user && @_user.password == user[:password]
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    if existing_user = where("lower(username) = ?", auth_hash[:info][:nickname].downcase).first
      existing_user.update(
        provider: auth_hash[:provider],
        bio: auth_hash[:info][:description],
        uid: auth_hash[:uid],
        token: auth_hash[:credentials][:token],
        secret: auth_hash[:credentials][:secret],
        profile_image: auth_hash[:info][:image]
      )
      return existing_user
    else
      new_user = create(
        username: auth_hash[:info][:nickname],
        email: auth_hash[:info][:nickname]+"@twitteruser.com",
        bio: auth_hash[:info][:description],
        profile_image: auth_hash[:info][:image],
        password: auth_hash[:uid],
        provider: auth_hash[:provider],
        uid: auth_hash[:uid],
        token: auth_hash[:credentials][:token],
        secret: auth_hash[:credentials][:secret]
      )
      return new_user
    end
  end
end
