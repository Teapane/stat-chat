class DashboardController < ApplicationController

  def index
    @ranked_users = User.ranked_users
  end

end
