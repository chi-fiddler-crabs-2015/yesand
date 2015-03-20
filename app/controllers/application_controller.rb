class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    redirect_to ideas_path
  end

  def about
  end

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_idea(id)
    Idea.find_by(id: id)
  end
end
