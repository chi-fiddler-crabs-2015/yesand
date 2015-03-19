class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    new_comment = idea_or_comment.comments.create(comment_params)
    new_comment.author = current_user
    if new_comment.save

    else
      redirect_to idea_path(idea_or_comment) if idea_or_comment.is_a? Idea
      redirect_to comment_path(idea_or_comment.idea) if idea_or_comment.is_a? Comment
    end
  end

  private

  def idea_or_comment
    if params[:comment][:type] == "Idea"
      Idea.find_by(params[:comment][:type_id])
    elsif params[:comment][:type] == "Comment"
      Comment.find_by(params[:comment][:type_id])
    end
  end

  def game_params
    params.require(:comment).permit(:text)
  end

end
