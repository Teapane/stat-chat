
class ExercismFetcher
  attr_reader :response, :stats

  def initialize(username)
    @response = Faraday.get("http://exercism.io/api/v1/stats/#{username}/snapshot")
    @stats = JSON.parse(response.body)
  end

  def hibernating_count
    stats[:activity][:exercises][:hibernating].to_i
  end
end
