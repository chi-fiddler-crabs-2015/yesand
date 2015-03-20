class AuthController < ApplicationController
  def new
    render :login
  end

  def login
    @user = User.authenticate(params[:user])
    if @user
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      @errors = "Username and/or Password invalid, try again"
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end
end
