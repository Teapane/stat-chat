class DashboardController < ApplicationController

  before_filter :require_login

  def index
    Resque.enqueue(TodaysScoreWorker, current_user.id)
    @ranked_users = User.ranked_users
  end

end
