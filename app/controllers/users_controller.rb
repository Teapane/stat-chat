class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @commit_points = @user.commit_points
    @badges = BadgeFetcher.new(@user.nickname).fetch
  end

end
