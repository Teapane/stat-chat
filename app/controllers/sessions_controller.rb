class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    @commit_fetcher = CommitFetcher.new(@user.nickname)
    @user.commits = @commit_fetcher.alltime_commits
    @user.save
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
