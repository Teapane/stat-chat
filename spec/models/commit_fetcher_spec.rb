require 'spec_helper'



describe CommitFetcher do

  attr_reader :response, :parsed_data

  before do
    VCR.use_cassette 'model/commit_fetcher' do
      # @response = Faraday.get('https://github.com/users/BryanaKnight/contributions_calendar_data')
      # @parsed_data = JSON.parse(@response.body)
      @commit_fetcher = CommitFetcher.new
      @response = @commit_fetcher.response
      @parsed_data = @commit_fetcher.commits
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

  it "should return only results from a specified week" do
    expect(@commit_fetcher.commits_for_week).to eq("something")
  end


end
