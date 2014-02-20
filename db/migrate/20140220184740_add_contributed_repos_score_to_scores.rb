class AddContributedReposScoreToScores < ActiveRecord::Migration
  def change
    add_column :scores, :contributed_repos_score, :integer, default: 0
  end
end
