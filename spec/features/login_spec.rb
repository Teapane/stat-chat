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
      valid_login
      current_path.should eq stats_path
    end

    it 'will save my email when I log in' do
      valid_login
      within('#account_info') do
        page.should have_content 'somebody@example.com'
      end
    end
  end

  def valid_login
    visit login_path
    click_on 'Login with Github'
  end

end
