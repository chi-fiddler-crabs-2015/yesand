require 'rails_helper'

describe Vote do
  it { should belong_to(:voter).class_name('User')}

  it { should belong_to(:votable) }

  it { should validate_presence_of(:voter) }

  it { should validate_presence_of(:votable) }

end
