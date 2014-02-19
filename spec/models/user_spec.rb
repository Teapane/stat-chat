require 'spec_helper'

describe User do

  it 'is invalid without an email' do
    it {should validate_presence_of(:email)}
  end

end
