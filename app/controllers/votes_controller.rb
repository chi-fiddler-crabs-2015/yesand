class VotesController < ApplicationController

  def create
    new_vote = idea_or_comment.votes.new
    new_vote.voter = current_user
    if new_vote.save
      redirect_to idea_path(params[:idea])
      # render nothing: (true for ajax)
    else
      redirect_to idea_path(params[:idea])
    end
  end

  private

  def idea_or_comment
    if params[:votable_type] == "Idea"
      Idea.find_by(id: params[:votable_id])
    elsif params[:votable_type] == "Comment"
      Comment.find_by(id: params[:votable_id])
    end
  end

  # private

  # def self.already_voted?
  #   if current_user.votes.where(votable_id: 1)
  #
  # end

end
