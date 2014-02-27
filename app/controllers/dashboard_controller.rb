class DashboardController < ApplicationController

  before_filter :require_login

  def index
    current_user.set_todays_score
    @ranked_users ||= User.ranked_users
  end

end
