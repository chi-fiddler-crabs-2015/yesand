class AuthController < ApplicationController
  def new
    render login_path
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      @errors = "Username and/or Password invalid, try again"
      render :'login'
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end
end
