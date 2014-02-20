require 'spec_helper'

describe CommitFetcher do

  attr_reader :response, :parsed_data, :commit_fetcher, :username

  before do
    VCR.use_cassette 'model/commit_fetcher' do
      @username = 'wvmitchell'
      @commit_fetcher = CommitFetcher.new(username)
      @response = commit_fetcher.response
      @parsed_data = commit_fetcher.commits
    end
  end

  it "gets response from github api" do
    expect(response.status).to eq 200
  end

  it "should fetch an array of commits for a user" do
    expect(parsed_data.first.count).to eq(2)
    expect(Date.parse(parsed_data.first[0])).to eq(Date.today - 365)
    expect(Date.parse(parsed_data.last[0])).to eq(Date.today)
  end

  it "should return only results from current week if no week is specified" do
    commits = [["2013/02/18", 0], ["2013/02/19", 0], ["2013/02/20", 0], ["2013/02/21", 0], ["2013/02/22", 0], ["2013/02/23", 0], ["2013/02/24", 0], ["2014/02/17", 1], ["2014/02/18", 0]]
    commit_fetcher.stub(:commits).and_return(commits)

    result = [["2014/02/17", 1], ["2014/02/18", 0]]
    expect(commit_fetcher.commits_for_week).to eq(result)
  end

  it "should return only results from the specified week" do
    commits = [["2014/01/19", 0], ["2014/01/20", 0], ["2014/01/21", 0], ["2014/01/22", 0], ["2014/01/23", 0], ["2014/01/24", 0], ["2014/02/17", 1], ["2014/02/18", 0]]
    commit_fetcher.stub(:commits).and_return(commits)

    result = [["2014/01/20", 0], ["2014/01/21", 0], ["2014/01/22", 0], ["2014/01/23", 0], ["2014/01/24", 0]]
    expect(commit_fetcher.commits_for_week(4)).to eq(result)
  end

  it "should return the total number of commits for the current week" do
    commits = [["2014/01/19", 0], ["2014/01/20", 0], ["2014/01/21", 0], ["2014/01/22", 0], ["2014/01/23", 0], ["2014/01/24", 0], ["2014/02/17", 1], ["2014/02/18", 10]]
    commit_fetcher.stub(:commits).and_return(commits)

    expect(commit_fetcher.number_of_commits_this_week).to eq(11)
  end


end
