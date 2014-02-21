require 'spec_helper'

describe RepoFetcher do 
  attr_reader :repo_fetcher, :username, :response

  before do
    VCR.use_cassette 'model/repo_fetcher' do
      @username = 'Teapane'
      @repo_fetcher = RepoFetcher.new(username)
      @response = repo_fetcher.response
      @parsed_data = repo_fetcher.repos
      repo_fetcher.stub(:repos).and_return(public_repos)
    end
  end

  def public_repos
    {"login"=>"Teapane", "id"=>4227025, "public_repos"=>25 }
  end

  it "gets response from github api" do
    expect(response).to eq 200
  end


  it "returns the correct count of public repos" do 
    expect(response["public_repos"]).to eq 25
  end

end
