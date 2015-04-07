require 'rails_helper'

describe Idea do
  it { should belong_to(:creator).class_name('User') }

  it { should have_many(:comments) }

  it { should have_many(:votes) }

  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:description) }

  it { should validate_presence_of(:creator) }

  it { should validate_uniqueness_of(:title) }

  it { should validate_length_of(:title).is_at_least(10) }

  it { should validate_length_of(:title).is_at_most(120) }

  it { should validate_length_of(:description).is_at_least(10) }

  it { should have_db_index(:creator_id) }

  it { should have_db_index(:title) }
end
