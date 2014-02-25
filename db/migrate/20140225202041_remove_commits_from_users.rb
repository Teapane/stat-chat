class RemoveCommitsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :commits, :integer
  end
end
