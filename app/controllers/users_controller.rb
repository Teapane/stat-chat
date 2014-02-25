class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    score = @user.scores.last
    @commits_score = score.commits_score
    @repos_score = score.public_repo_score
    @exercism_submissions_score = score.submissions_score
    @badges = BadgeFetcher.new(@user.nickname).fetch
  end

end
