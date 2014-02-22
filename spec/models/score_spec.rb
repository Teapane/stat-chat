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

  attr_reader :username

  before do 
   VCR.use_cassette 'model/exercism_fetcher_score' do
      @username = 'Teapane'
    end  
  end

  it "can calculate exercism languages score" do  
    score.exercism_language_score.should be 1000
    end


  xit "can calculate exercism nitpicks score" do 
    score.exercism_nitpick_score.should be 0
  end


end
