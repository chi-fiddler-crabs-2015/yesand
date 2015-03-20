class CommentsController < ApplicationController

  respond_to :html, :js

  def new
    @commentable_id = params[:commentable_id]
    @commentable_type = params[:commentable_type]
    render partial: 'new'
  end

  def create
    new_comment = idea_or_comment.comments.new(text: comment_params[:text])
    new_comment.author = current_user
    if new_comment.save
      render partial: 'show', locals: { comment: idea_or_comment }, layout: false if idea_or_comment.is_a? Comment
      render partial: 'show', locals: { idea: idea_or_comment }, layout: false if idea_or_comment.is_a? Idea
    else
      redirect_to idea_path(idea_or_comment) if idea_or_comment.is_a? Idea
      redirect_to comment_path(idea_or_comment) if idea_or_comment.is_a? Comment
    end
  end

  private

  def idea_or_comment
    if params[:comment][:commentable_type] == "Idea"
      Idea.find_by(id: params[:comment][:commentable_id])
    elsif params[:comment][:commentable_type] == "Comment"
      Comment.find_by(id: params[:comment][:commentable_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end

end
