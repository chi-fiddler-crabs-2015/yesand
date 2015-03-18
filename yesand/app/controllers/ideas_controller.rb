class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    current_user.ideas.create(idea_params)
  end

  def show
  end

  def user_params
    params.require(:idea).permit(:title, :description)
  end
end
