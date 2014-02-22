require 'spec_helper'

describe Score do

  it {should validate_presence_of(:commits_score)}
  it {should validate_presence_of(:public_repo_score)}
  it {should validate_presence_of(:contributed_repos_score)}
  it {should validate_presence_of(:hibernating_score)}
  it {should validate_presence_of(:nitpicks_score)}
  it {should validate_presence_of(:submissions_score) }
  it {should validate_presence_of(:languages_score)}

  let(:score) { FactoryGirl.create(:score) }

  it "can calculate an agregate score" do
    score.total.should be 410
  end

  it "can calculate exercism languages score" do 
    VCR.use_cassette 'model/exercism_fetcher_score' do
      username = 'Teapane'
    score.exercism_language_score(username).should be 40
    end
  end

end
