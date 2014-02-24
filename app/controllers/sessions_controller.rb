class SessionsController < ApplicationController

  def new
    render layout: 'login'
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    @user.update_commits
    session[:user_id] = @user.id
    #binding.pry
    set_score
    redirect_to stats_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def set_score
   score = @user.scores.find_or_create_by(created_at: Time.now.strftime("%Y-%m-%d"))
   score.update_attributes(public_repo_score: CommitCounter.new(CommitFetcher.fetch(@user.nickname)).alltime_commits)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
