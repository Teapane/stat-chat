class User < ActiveRecord::Base

  validates_presence_of :email, :nickname, :commits

  def self.find_or_create_from_auth_hash(auth_hash)
    @user = User.find_or_create_by(
      email: auth_hash[:info][:email],
      nickname: auth_hash[:info][:nickname]
    )
  end

  def update_commits
    @commit_fetcher = CommitFetcher.new(self.nickname)
    self.commits = @commit_fetcher.alltime_commits
    self.save
  end

  def rank
    ranked_users = User.all.sort_by { |user| user.score }
    ranked_users.index(self) + 1
  end

  def score
    (commits * 0.25)
  end

  def commit_points
    (commits * 0.25)
  end



end
