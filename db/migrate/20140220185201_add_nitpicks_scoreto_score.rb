class AddNitpicksScoretoScore < ActiveRecord::Migration
  def change
    add_column :scores, :nitpicks_score, :integer, default: 0
  end
end
