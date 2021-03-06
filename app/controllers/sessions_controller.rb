class SessionsController < ApplicationController

  def new
    render layout: 'login'
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to stats_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
