class DashboardController < ApplicationController

  def index
    @ranked_users = User.all
  end

  def profile
  end

end
