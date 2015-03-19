class CommentsController < ApplicationController

  def create
    new_comment = idea_or_comment.comments.new(text: comment_params[:text])
    new_comment.author = current_user
    if new_comment.save
      render :nothing => true
    else
      redirect_to idea_path(idea_or_comment) if idea_or_comment.is_a? Idea
      redirect_to comment_path(idea_or_comment.idea) if idea_or_comment.is_a? Comment
    end
  end

  private

  def idea_or_comment
    if params[:comment][:commentable_type] == "Idea"
      puts 'idea'
      Idea.find_by(id: params[:comment][:commentable_id])
    elsif params[:comment][:commentable_type] == "Comment"
      puts 'comment'
      Comment.find_by(id: params[:comment][:commentable_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end

end
