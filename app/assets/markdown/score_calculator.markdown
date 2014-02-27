###The basic breakdown###
  Billy's Picks compiles a score for you based on your [**GitHub**](http://github.com) Commits and Public Repos, as well as your stats from [***exercism.io***](http://exercism.io), mainly your submissions, what languages you have completed exercises in, and nitpicks you have done.  

  1. GitHub Commits are worth 1 point.
  2. GitHub Public Repos are worth 2 points.
  3. Exercism submissions are worth 2 points. 
  4. Exercism languages are each worth 10 points.  For example, if you have exercises done in Ruby and JavaScript, that is a base of 20 points towards your total score. 
  5. Exercism Hibernating submissions are deduction of three points.  Don't let those exercises sleep!
  6. Exercism nitpicks are worth 3 points.  

  ###Below is the code for the algorithm that compiles your score###


###Total Method

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

