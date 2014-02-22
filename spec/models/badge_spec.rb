require 'spec_helper'

describe Badge do

  attr_reader :badge

  before do
    attributes = {
      name: 'Woodchuck',
      image: 'someurl.example.com',
      description: 'Its really nothing, really'
    }
    @badge = Badge.new(attributes)
  end

  it "has a name" do
    badge.name.should eq "Woodchuck"
  end

  it "has an image url" do
    badge.image.should eq 'someurl.example.com'
  end

  it 'has a description' do
    badge.description.should eq 'Its really nothing, really'
  end


end
