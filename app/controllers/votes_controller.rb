class VotesController < ApplicationController

  def create
    new_vote = idea_or_comment.votes.new
    new_vote.voter = current_user
    if new_vote.save
      render nothing: true
    else
      redirect_to idea_path(idea_or_comment) if idea_or_comment.is_a? Idea
    end
  end

  private

  def idea_or_comment
    if params[:comment][:votable_type] == "Idea"
      Idea.find_by(id: params[:comment][:votable_id])
    elsif params[:comment][:votable_type] == "Comment"
      Comment.find_by(id: params[:comment][:votable_id])
    end
  end

  def votes_params
    params.require(:comment).permit(:votable_id, :votable_type)
  end

end
