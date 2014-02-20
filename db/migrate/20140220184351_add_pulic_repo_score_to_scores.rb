class AddPulicRepoScoreToScores < ActiveRecord::Migration
  def change
    add_column :scores, :public_repo_score, :integer, default: 0
  end
end
