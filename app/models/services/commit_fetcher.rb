class CommitFetcher
  attr_reader :events

  def raw_events(user)
    response = Faraday.get('https://api.github.com/users/#{user.github_name}/events')
    @events = JSON.parse(response.body)
  end

  def commits(user)
    events.select do |hash|
      hash["type"] == "PushEvent" && hash["payload"]["commits"][0]["author"]["email"] == user.email 
    end
  end

end
