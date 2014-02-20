require 'spec_helper'

describe Score do
  
  it {should validate_presence_of(:commits_score)}
  it {should validate_presence_of(:public_repo_score)}
  it {should validate_presence_of(:contributed_repos_score)}
end
