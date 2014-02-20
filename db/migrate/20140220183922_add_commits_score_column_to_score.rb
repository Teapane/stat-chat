class AddCommitsScoreColumnToScore < ActiveRecord::Migration
  def change
    add_column :scores, :commits_score, :integer, :default => 0
  end
end
