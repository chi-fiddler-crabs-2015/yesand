require 'rails_helper'

describe Vote do
  it { should belong_to(:voter).class_name('User')}

  it { should belong_to(:votable) }

  it { should validate_presence_of(:voter) }

  it { should validate_presence_of(:votable) }

  # it { should validate_uniqueness_of(:voter).scoped_to(:votable).with_message("you can only vote once on this!") }
end
