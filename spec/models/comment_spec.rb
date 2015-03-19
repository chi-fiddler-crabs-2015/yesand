require 'rails_helper'

describe Comment do
  it { should belong_to(:author).class_name('User') }
  it { should belong_to(:commentable) }
  it { should have_many(:comments) }
  # it { should have_many(:votes) }
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:author) }
  it { should have_db_index(:author_id) }
end
