require 'rails_helper'

RSpec.describe IdeasController, :type => :controller do
  describe '#index' do
    it 'assigns ideas as @ideas' do
      get :index
      expect(assigns(:ideas)).to eq(Idea.all)
    end

    it {
      get :index
      should render_template('index')
    }
  end

  describe '#new' do
    it 'assigns a blank unsaved idea as @idea' do
      get :new
      expect(assigns(:idea)).to be_a_new Idea
    end

    it {
      get :new
      should render_template('new')
    }
  end

  describe '#create' do
    it 'creates a new idea' do
      expect(
        post :create, { idea: { title: 'hello hello', description: 'hello hello again' } }
      ).to change(Idea.count).by 1
    end

    # it {
    #   get :create
    #   # redirect_to
    # }
  end


end
