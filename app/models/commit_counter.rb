# data = CommitFetcher.fetch(username)
# CommitCounter.new(data)

class CommitCounter 
  attr_reader :commits

  def initialize(data, wrapper: CommitBatch)
    @commits = data.map{|d| wrapper.new(d)}
  end

  def number_of_commits_this_week
    commits_for_week.map(&:total).sum
  end

  def commits_for_week(week_num = this_week)
    commits.select { |commit| (find_week(commit.date)) == week_num && (find_year(commit.date) == this_year)}
  end

  def alltime_commits
    commits.inject(0) {|total, commit| total + commit.total }
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

  def this_week
    Date.today.cweek
  end

end
