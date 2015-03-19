module ApplicationHelper
  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
