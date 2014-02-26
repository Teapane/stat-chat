class UsersController < ApplicationController

  before_filter :require_login

  def show
    @user = User.find(params[:id])
    score = @user.scores.last
    @commits_score = score.commits_score
    @repos_score = score.public_repo_score
    @exercism_submissions_score = score.submissions_score
    @badges = BadgeFetcher.new(@user.nickname).fetch
    @weeks = recent_weeks
    @weekly_commits = get_weekly_commits
  end

  private

  def recent_weeks
    ((Date.today.cweek-7)..(Date.today.cweek)).to_a.collect do |week|
      Date.commercial(Date.today.year, week, 1).strftime("%m/%d")
    end
  end

  def get_weekly_commits
    ((Date.today.cweek-7)..(Date.today.cweek)).to_a.collect do |week|
      CommitCounter.new(CommitFetcher.fetch(current_user.nickname)).commits_for_week(week).inject(0) do |sum, commit|
        sum + commit.total
      end
    end
  end

end
