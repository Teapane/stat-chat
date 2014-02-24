require 'spec_helper'

describe BadgeFetcher do

  attr_reader :badge_fetcher

  before do
    @badge_fetcher = BadgeFetcher.new('wvmitchell')
  end

  it 'should have a username' do
    badge_fetcher.username.should eq 'wvmitchell'
  end

  it 'should fetch an array of badges' do
    badge_fetcher.fetch.each do |badge|
      badge.class.should eq Badge
    end
  end

  it 'should fetch badges for the user' do
    badge_fetcher.fetch.first.username.should eq 'wvmitchell'
  end

  it 'should not error out on invalid user' do
    @badge_fetcher = BadgeFetcher.new('jodfwokw')
    badge_fetcher.fetch.count.should eq 0
  end

end
