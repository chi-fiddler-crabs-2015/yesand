class CommentsController < ApplicationController

  def create
    new_comment = idea_or_comment.comments.create(comment_params)
    new_comment.author = current_user
    if new_comment.save

    else

    end
  end

  def new
    @comment = Comment.new
  end

  private

  def idea_or_comment
    if params[:comment][:type] == "Idea"
      Idea.find_by(params[:comment][:type_id])
    elsif params[:comment][:type] == "Comment"
      Comment.find_by(params[:comment][:type_id])
    end
  end

end
