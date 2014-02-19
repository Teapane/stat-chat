class DashboardController < ApplicationController

  def index
    @ranked_users = User.all
  end

  def profile
    @user = User.find_by(params[:id])
    @commit_points = @user.commit_points
  end

end
