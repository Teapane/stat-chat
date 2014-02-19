class AddColumnCommitsToUser < ActiveRecord::Migration
  def change
    add_column :users, :commits, :integer, default: 0
  end
end
