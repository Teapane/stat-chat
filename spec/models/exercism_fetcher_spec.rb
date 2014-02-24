require 'spec_helper'

describe ExercismFetcher do
  attr_reader :response, :exercism_fetcher

  before do
    VCR.use_cassette 'model/exercism_fetcher' do
      username = 'BryanaKnight'
      @exercism_fetcher = ExercismFetcher.new(username)
      @response = exercism_fetcher.response
      @parsed_data = exercism_fetcher.stats
    end
  end

  it "gets response from exercism api" do
   expect(response.status).to eq 200
  end

  it "returns hibernating exercises" do
    expect(exercism_fetcher.hibernating_count).to eq 3
  end

  it "returns nitpicks given" do
    expect(exercism_fetcher.nitpick_count).to eq 0
  end

  it "returns total submissions" do
    expect(exercism_fetcher.submission_count).to eq 34
  end

  it "returns total languages" do
    expect(exercism_fetcher.language_count).to eq 2
  end
end

