require 'spec_helper'

describe Score do

  it {should validate_presence_of(:commits_score)}
  it {should validate_presence_of(:public_repo_score)}
  it {should validate_presence_of(:contributed_repos_score)}
  it {should validate_presence_of(:hibernating_score)}
  it {should validate_presence_of(:nitpicks_score)}
  it {should validate_presence_of(:submissions_score) }
  it {should validate_presence_of(:languages_score)}
end
