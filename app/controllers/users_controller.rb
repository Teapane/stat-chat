class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @commit_points = @user.commit_points
  end
end
