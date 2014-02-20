require 'spec_helper'

describe User do

  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:nickname)}
  it {should validate_presence_of(:commits)}

  let(:user) { FactoryGirl.create(:user)}
  let(:score) { FactoryGirl.create(:score)}

  it 'should not have any scores by default' do
    user.scores.count.should be 0
  end

  it 'can be associated with a score' do
    user.scores << score
    user.scores.count.should be 1
    user.scores.first.should eq score
  end

end
