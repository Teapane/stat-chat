class CommitFetcher
  attr_reader :commits, :response

  def initialize
    #USER SHOULD BE PASSED IN TO INITIALIZE
    @response = Faraday.get('https://github.com/users/BryanaKnight/contributions_calendar_data')
    @commits = JSON.parse(response.body)
  end

  def number_of_commits_this_week
    commits_for_week.map do |summary|
      summary[1]
    end.inject(:+)
  end

  def commits_for_week(week_num = Date.today.cweek)
    commits.select { |item| (Date.parse(item[0])).cweek == week_num && (Date.parse(item[0]).year == Date.today.year)}
  end

end
