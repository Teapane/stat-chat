require 'spec_helper'

describe CommitCounter do
  attr_reader :commit_counter

  before do 
    data = [["2014/01/19", 0], 
            ["2014/01/01", 2], 
            ["2014/01/20", 0], 
            ["2014/01/21", 0], 
            ["2014/01/22", 3], 
            ["2014/01/23", 4], 
            ["2014/01/24", 0], 
            ["2014/02/11", 1], 
            ["2014/02/10", 10],
            ["2013/02/11", 2],
            ["#{Date.today}", 20]]
    @commit_counter = CommitCounter.new(data)
  end

  # before do
  #   VCR.use_cassette 'model/commit_fetcher' do
  #     @username = 'wvmitchell'
  #     @commit_fetcher = CommitFetcher.new(username)
  #     @response = commit_fetcher.response
  #     @parsed_data = commit_fetcher.commits
  #   end
  # end

  # it "gets response from github api" do
  #   expect(response.status).to eq 200
  # end

  # it "should fetch an array of commits for a user" do
  #   expect(parsed_data.first.count).to eq(2)
  #   expect(Date.parse(parsed_data.first[0])).to eq(Date.today - 365)
  #   expect(Date.parse(parsed_data.last[0])).to eq(Date.today)
  # end

  it "should return only results from current week if no week is specified" do
    expect(commit_counter.commits_for_week.count).to eq(1)
    expect(commit_counter.commits_for_week.first.total).to eq(20)
  end

  it "should return only results from the specified week" do
    expect(commit_counter.commits_for_week(4).count).to eq(5)
    expect(commit_counter.commits_for_week(1).count).to eq(1)
  end

  it "returns number of commits for this week only" do 
    expect(commit_counter.number_of_commits_this_week).to eq(20)
  end

  it "returns number of commits all time" do 
    expect(commit_counter.alltime_commits).to eq(42)
  end


end
