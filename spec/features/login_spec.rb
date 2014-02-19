require 'spec_helper'

describe 'login with github' do

  context 'when I visit the page without having logged in' do
    it 'has a login form' do
      visit login_path
      within('#login_form') do
        page.should have_link('Login with Github')
      end
    end

    it 'can log me in' do
      visit login_path
      click_on 'Login with Github'
      current_path.should be stats_path
    end
  end

end
