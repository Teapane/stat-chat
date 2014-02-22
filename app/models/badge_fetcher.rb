class BadgeFetcher

  attr_reader :username

  def initialize(username)
    @username = username
  end

  def fetch
    [Badge.new, Badge.new]
  end

end
