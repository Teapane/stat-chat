class BadgeFetcher

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def fetch
    response = Faraday.get("https://coderwall.com/#{username}.json")
    parsed = JSON.parse(response.body)
    parsed["badges"].collect do |badge_details|
      attributes = {
        username: username,
        name: badge_details["name"],
        image: badge_details["badge"],
        description: badge_details["description"]
      }
      Badge.new attributes
    end
  end

end
