class AddColumnLanguagesScoretoScore < ActiveRecord::Migration
  def change
    add_column :scores, :languages_score, :integer, default: 0
  end
end
