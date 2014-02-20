class CommitBatch
  attr_reader :date, :total

  def initialize(data) # ["date", number_of_commits (int)]
    @date = data[0]
    @total = data[1]
  end

end
