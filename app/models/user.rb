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

  def score
    scores.last.total
  end

  def self.ranked_users
    User.all.sort_by { |user| user.score }.reverse
  end

  def set_todays_score
    score = todays_score || scores.create
    score.update_attributes(
      commits_score: Score.github_commits_score(nickname),
      public_repo_score: Score.github_repos_score(nickname),
      hibernating_score: Score.exercism_hibernating_score(nickname),
      nitpicks_score: Score.exercism_nitpick_score(nickname),
      submissions_score: Score.exercism_submissions_score(nickname),
      languages_score: Score.exercism_language_score(nickname)
      )
  end

  private

  def todays_score
    scores.detect { |score| score.created_at.strftime("%Y-%m-%d") == Time.now.strftime("%Y-%m-%d") }
  end

end
