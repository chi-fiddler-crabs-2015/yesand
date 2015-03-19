require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  describe '#create' do
    #### User factory girl to generate these - refactor opportunity
    let!(:idea) { Idea.create(title: 'hellohello', description: 'hellohellohello') }
    let!(:user) { User.create(username: 'hello', email: 'hello@hello.com', password: "hello") }
    before { allow(controller).to receive(:current_user) { user } }
    let!(:comment) { idea.comments.create(author: user, text: 'hellohellohello') }

    it 'creates a new comment from Idea' do
      expect do
        post :create, {
          comment: {
            commentable_type: 'Idea', commentable_id: idea.id, text: 'this is a great idea'
          }
        }
     end.to change{Comment.count}.by 1
    end

    it 'renders the new comment partial from idea' do
      post :create, {
        comment: {
          commentable_type: 'Idea', commentable_id: idea.id, text: 'this is a great idea'
        }
      }
      should render_template('_show')
    end

    it 'creates a new comment from Comment' do
      expect do
        post :create, {
          comment: {
            commentable_type: 'Comment', commentable_id: comment.id, text: 'this is a great idea'
          }
        }
     end.to change{Comment.count}.by 1
    end

    it 'renders the new comment partial from comment' do
      post :create, {
        comment: {
          commentable_type: 'Comment', commentable_id: comment.id, text: 'this is a great idea'
        }
      }
      should render_template('_show')
    end

    # it {
    #   get :create
    #   # redirect_to
    # }
  end


end

