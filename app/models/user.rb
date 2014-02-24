class User < ActiveRecord::Base

  validates_presence_of :email, :nickname, :commits
  has_many :scores

  def self.find_or_create_from_auth_hash(auth_hash)
    @user = User.find_or_create_by(
      email: auth_hash[:info][:email],
      nickname: auth_hash[:info][:nickname]
    )
  end

  def update_commits
    commit_counter = CommitCounter.new(CommitFetcher.fetch(self.nickname))
    self.commits = commit_counter.alltime_commits
    self.save
  end

  def rank
    User.ranked_users.index(self) + 1
  end

  def self.ranked_users
    User.all.sort_by { |user| user.score }.reverse
  end

  def score
    (commits * 0.25)
  end

  def commit_points
    (commits * 0.25)
  end

  def set_todays_score
    score = todays_score || scores.create
    score.update_attributes(public_repo_score: CommitCounter.new(CommitFetcher.fetch(nickname)).alltime_commits)
  end

  private

  def todays_score
    scores.detect { |score| score.created_at.strftime("%Y-%m-%d") == Time.now.strftime("%Y-%m-%d") }
  end

end
