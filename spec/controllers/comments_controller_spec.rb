require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  describe '#new' do
    it 'assigns a blank unsaved comment as @comment' do
      get :new
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  describe '#create' do
    it 'creates a new comment from Idea' do
      Idea.create(title: 'hellohello', description: 'hellohellohello')
      expect(
        post :create, { comment: { type: 'Idea', type_id: '1', text: 'this is a great idea' } }
      ).to change(Comment.count).by 1
    end

    # it {
    #   get :create
    #   # redirect_to
    # }
  end


end

