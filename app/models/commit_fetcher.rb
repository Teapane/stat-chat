class CommitFetcher
  attr_reader :commits, :response

  def initialize(username)
    #USER SHOULD BE PASSED IN TO INITIALIZE
    @response = Faraday.get("https://github.com/users/#{username}/contributions_calendar_data")
    @commits = JSON.parse(response.body)
  end

  def number_of_commits_this_week
    commits_for_week.map do |summary|
      summary[1]
    end.inject(:+)
  end

  def commits_for_week(week_num = this_week)
    commits.select { |item| (find_week(item[0])) == week_num && (find_year(item[0]) == this_year)}
  end

  def alltime_commits
    commits.map {|commit| commit[1]}.reduce(:+)
  end

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
