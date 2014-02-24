class RepoFetcher
  attr_reader :username

  def self.fetch(username)
    new(username).fetch
  end

  def initialize(username)
    @username = username
  end

  def repos
   body["public_repos"]
  end

  def response
    Faraday.get("https://api.github.com/users/#{username}")
  end

  def body
    JSON.parse(response.body)
  end
  
end
