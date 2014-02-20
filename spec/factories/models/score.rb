FactoryGirl.define do
  factory :score do
    commits_score 100
    public_repo_score 50
    contributed_repos_score 50
    hibernating_score 10
    nitpicks_score 50
    submissions_score 50
    languages_score 100
  end
end
