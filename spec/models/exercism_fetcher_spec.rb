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
  end

