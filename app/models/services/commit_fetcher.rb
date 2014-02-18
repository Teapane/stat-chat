class CommitFetcher
  attr_reader :commits

  def raw_commits(user)
    response = Faraday.get('https://github.com/users/#{user.username}/contributions_calendar_data')
    @commits = JSON.parse(response.body)
  end

  def commits_this_week(user)
    commits_for_current_week.map do |summary|
      summary[1]
    end.inject(:+)
  end

  def commits_for_week(week_num = Date.today.cweek)
    commits.select { |item| (Date.parse(item[0])).cweek == week_num }
  end

end
