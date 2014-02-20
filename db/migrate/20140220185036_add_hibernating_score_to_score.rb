class AddHibernatingScoreToScore < ActiveRecord::Migration
  def change
    add_column :scores, :hibernating_score, :integer, default: 0
  end
end
