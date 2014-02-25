# data = CommitFetcher.fetch(username)
# CommitCounter.new(data)

class CommitCounter
  attr_reader :commits

  def initialize(data, options = {wrapper: CommitBatch})
    @commits = data.map{|d| options[:wrapper].new(d)}
  end

  def number_of_commits_this_week
    commits_for_week.map(&:total).sum
  end

  def commits_for_week(week_num = this_week)
    commits.select { |commit| (find_week(commit.date)) == week_num && (find_year(commit.date) == this_year)}
  end

  def commits_for_week_last_year(week_num = this_week)
    commits.select { |commit| (find_week(commit.date)) == week_num && (find_year(commit.date) == last_year)}
  end

  def alltime_commits
    commits.inject(0) {|total, commit| total + commit.total }
  end

  def last_six_months_commits
    commits_in_last(26).reduce(0) { |sum, commit| sum + commit.total}
  end

  def commits_in_last(num_weeks)
    start = this_week - num_weeks
    (start..this_week).collect do |n|
      n < 1 ? commits_for_week_last_year(n+52) : commits_for_week(n)
    end.flatten
  end

  private

  def find_year(date)
    Date.parse(date).year
  end

  def find_week(date)
    Date.parse(date).cweek
  end

  def this_year
    Date.today.year
  end

  def last_year
    Date.today.year-1
  end

  def this_week
    Date.today.cweek
  end

end
