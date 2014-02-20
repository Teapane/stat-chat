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

    def snapshot
      snapshot = {
                    activity: {
                    most_recent: {
                    submission: "2014-02-19T04:23:37Z",
                    nitpick: "2014-01-15T17:45:11Z"
                    },
                    exercises: {
                    active: "1",
                    hibernating: "3",
                    completed: "7"
                    },
                    total: {
                    nitpicks: "0",
                    submissions: "30",
                    languages: 2
                    },
                    past7: {
                    nitpicks: "0",
                    submissions: "3",
                    languages: 1
                    }
                    }
                    }
    end

    it "gets response from exercism api" do
     expect(response.status).to eq 200
    end

    it "returns hibernating exercises" do 
      
      exercism_fetcher.stub(:stats).and_return(snapshot)
      expect(exercism_fetcher.hibernating_count).to eq 3
    end
  end

