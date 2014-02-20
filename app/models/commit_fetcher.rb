class CommitFetcher
  attr_reader :username

  def self.fetch(username)
    new(username).fetch
  end

  def initialize(username)
    @username = username
  end

  def fetch
    JSON.parse(response.body)
  end

  def response
    Faraday.get("https://github.com/users/#{username}/contributions_calendar_data")
  end

end


