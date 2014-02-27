class TodaysScoreWorker

  @queue = :todays_score

  def self.perform(user_id)
    user = User.find(user_id)
    user.set_todays_score
  end

end
