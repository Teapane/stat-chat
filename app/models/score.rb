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
end
