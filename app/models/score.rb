class Score < ActiveRecord::Base
  validates_presence_of :commits_score, :public_repo_score, 
                        :contributed_repos_score, :hibernating_score, 
                        :nitpicks_score, :submissions_score, 
                        :languages_score

  belongs_to :user

  def total
    values = 0
    attributes.each_key do |key|
      values += attributes[key] if key.ends_with?("score")
    end
    values
  end

  def exercism_language_score
    attributes["languages_score"] * 10
  end

  def exercism_nitpick_score
    attributes["nitpicks_score"] * 3
  end

  def exercism_submissions_score 
    attributes["submissions_score"] * 2
  end

  def exercism_hibernating_score
    attributes["hibernating_score"] * -3
  end

  def github_commits_score
    attributes["commits_score"]
  end

  def github_repos_score
    attributes["public_repo_score"] * 2
  end
end
