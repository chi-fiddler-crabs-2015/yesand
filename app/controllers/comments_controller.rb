class CommentsController < ApplicationController

  respond_to :html, :js

  def new
    idea_id = params[:idea_id]
    # @commentable_id = params[:commentable_id]
    # @commentable_type = params[:commentable_type]
    render partial: 'new', locals: { idea_id: idea_id }
  end

  def create

    idea = Idea.find_by(id: params[:comment][:commentable_id].to_i)
    # raise params[:comment][:commentable_id].inspect
    new_comment = idea.comments.new(text: comment_params[:text])
    new_comment.author = current_user
    new_comment.author
    if new_comment.save
      redirect_to idea_path(idea)
      # render partial: 'show', locals: { comment: idea_or_comment }, layout: false if idea_or_comment.is_a? Comment
      # render partial: 'show', locals: { idea: idea }, layout: false # if idea_or_comment.is_a? Idea
    else
      redirect_to idea_path(idea) # if idea_or_comment.is_a? Idea
      # redirect_to comment_path(idea_or_comment) if idea_or_comment.is_a? Comment
    end
  end

  private

  ## Dorment for now
  def idea_or_comment
    puts params
    if params[:comment][:commentable_type] == "Idea"
      Idea.find_by(id: params[:comment][:commentable_id])
    elsif params[:comment][:commentable_type] == "Comment"
      Comment.find_by(id: params[:comment][:commentable_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end

  # def idea_param
  #   params.require(:idea_id)
  # end

end
