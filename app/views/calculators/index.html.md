###Total Method###

```ruby
  def total
    values = 0
    attributes.each_key do |key|
      values += attributes[key] if key.ends_with?("score")
    end
    values
  end
  ```

  ###The following methods are used to multiply a score that is passed into total###

  ```ruby
  def self.exercism_language_score(nickname)
    ExercismFetcher.new(nickname).language_count * 10
  end

  def self.exercism_nitpick_score(nickname)
    ExercismFetcher.new(nickname).nitpick_count * 3
  end

  def self.exercism_submissions_score(nickname)
    ExercismFetcher.new(nickname).submission_count * 2
  end

  def self.exercism_hibernating_score(nickname)
    ExercismFetcher.new(nickname).hibernating_count * -3
  end

  def self.github_commits_score(nickname)
    CommitCounter.new(CommitFetcher.fetch(nickname)).last_six_months_commits
  end

  def self.github_repos_score(nickname)
    RepoFetcher.new(nickname).repos * 2
  end
```

