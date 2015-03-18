class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    new_idea = current_user.ideas.create(idea_params)
    if new_idea.valid?
      redirect_to idea_path(new_idea)
    else
      @errors = "Make sure the title is between 10 and 120 characters and the description is longer than 5 characters"
      render :'new'
    end
  end

  def show
    @idea = find_idea(params[:id]) ## Write helper once views are integrated and we can test
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
