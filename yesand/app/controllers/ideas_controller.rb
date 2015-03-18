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
    @idea = Idea.find_by(id: params[:id]) ## Write helper once views are integrated and we can test
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
