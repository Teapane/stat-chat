class Score < ActiveRecord::Base
  validates_presence_of :commits_score, :public_repo_score, :contributed_repos_score, :hibernating_score, :nitpicks_score
end
