require 'rails_helper'

RSpec.describe VotesController, :type => :controller do

  describe '#create' do
    #### User factory girl to generate these - refactor opportunity
    let!(:user) { User.create!(username: 'hello', email: 'hello@hello.com', password: "hello") }
    let!(:idea) { Idea.create!(title: 'hellohello', description: 'hellohellohello', creator: user) }
    before { allow(controller).to receive(:current_user) { user } }
    let!(:comment) { idea.comments.create(author: user, text: 'hellohellohello') }

    it 'creates a new vote from Idea' do
      expect do
        post :create, {
          comment: { votable_type: 'Idea', votable_id: idea.id }
        }
     end.to change{Vote.count}.by 1
    end


    it 'creates a new vote from Comment' do
      expect do
        post :create, {
          comment: {
            votable_type: 'Comment', votable_id: comment.id, text: 'this is a great idea'
          }
        }
     end.to change{Vote.count}.by 1
    end

  end


end


