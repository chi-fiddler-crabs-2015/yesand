require 'rails_helper'

describe User do
  it { should have_many(:ideas).with_foreign_key(:creator_id) }

  it { should have_many(:comments).with_foreign_key(:author_id) }

  it { should have_many(:votes).with_foreign_key(:voter_id) }

  it { should validate_presence_of(:username) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password_hash) }

  it { should validate_uniqueness_of(:email) }

  it { should validate_uniqueness_of(:username) }

  it { should allow_value('hello@hello.com').for(:email)}

end
