module DashboardHelper

  def score(user)
    user.commits
  end

end
