require 'spec_helper'

describe Score do

  it {should validate_presence_of(:commits_score)}
  it {should validate_presence_of(:public_repo_score)}
  it {should validate_presence_of(:contributed_repos_score)}
  it {should validate_presence_of(:hibernating_score)}
  it {should validate_presence_of(:nitpicks_score)}
  it {should validate_presence_of(:submissions_score) }
  it {should validate_presence_of(:languages_score)}


  attr_reader :username

  before do
   VCR.use_cassette 'model/exercism_fetcher_score' do
      @username = 'Teapane'
    end
  end

  it "can calculate exercism languages score" do
    Score.exercism_language_score(username).should be 40
  end

  it "can calculate exercism nitpicks score" do
    Score.exercism_nitpick_score(username).should be 3
  end

  it "can calculate exercism submissions score" do
    Score.exercism_submissions_score(username).should be 126
  end

  it "can calculate exercism hibernating exercises score" do
    Score.exercism_hibernating_score(username).should be 0
  end

  it "can calculate total GitHub commits" do
    Score.github_commits_score(username).should be 595
  end

  it "can calculate total public GitHub repos" do
    Score.github_repos_score(username).should be 50
  end


end
