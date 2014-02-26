class AddIndexToScores < ActiveRecord::Migration
  def change
    add_index :scores, :user_id
  end
end
