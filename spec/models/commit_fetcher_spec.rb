require 'spec_helper'

describe CommitFetcher do
  attr_reader :username

  before do
    VCR.use_cassette 'model/commit_fetcher' do
      @username = 'wvmitchell'
    end
  end

  it "gets response from github api" do
    expect(CommitFetcher.new(username).response.status).to eq 200
  end

end
