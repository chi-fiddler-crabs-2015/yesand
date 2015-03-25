module ApplicationHelper
  include TweetButton

  TweetButton.default_tweet_button_options = {:via => "TeamYesAnd"}

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
