class AddColumnSubmissionsScoretoScores < ActiveRecord::Migration
  def change
    add_column :scores, :submissions_score, :integer, default: 0
  end
end
