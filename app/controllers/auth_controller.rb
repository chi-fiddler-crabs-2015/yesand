class AuthController < ApplicationController
  def new
    render :login
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    raise: test
    session[:user_id] = @user.id
    redirect_to ideas_path
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

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
