require 'spec_helper'

describe 'login with github' do

  context 'when I visit the page without having logged in' do
    it 'has a login form' do
      visit login_path
      within('.login-button') do
        page.should have_button('Login with Github')
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

  context 'when I login with github' do
    it 'displays username on the power rankings' do
      valid_login
      within('.widget-content') do
        page.should have_content 'somebody'
      end
    end

    it 'displays a score based on api gathered info' do
      valid_login
      within('tbody tr:first .power_points') do
        page.should have_content 25
      end
    end
  end


  def valid_login
    visit login_path
    click_on 'Login with Github'
  end

end
