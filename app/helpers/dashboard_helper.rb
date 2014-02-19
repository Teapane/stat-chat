module DashboardHelper

  def score(user)
    score = 0
    score += (user.commits * 0.25)
    # score += user.exercisms
    # score += chat_points
  end

end
