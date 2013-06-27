require 'spec_helper'

describe SessionsController do
  
  describe "the signin process", :js => true, :type => :feature do
    before :each do
      User.create(:name => 'maria',
                :email => 'maria@maria.com', 
                :password => 'mariamaria',
                :password_confirmation => 'mariamaria')
    end

    it "signs me in with valid input" do
      visit signin_path
      within('form') do
        fill_in 'session_email', :with => 'maria@maria.com'
        fill_in 'session_password', :with => 'mariamaria'
        click_button 'Sign In'
      end
      expect(page).to have_content 'Sign Out'
    end

    it "doesn't sign me in with invalid input" do
      visit signin_path
      within('form') do
        fill_in 'session_email', :with => 'maria@maria.com'
        fill_in 'session_password', :with => 'maria'
        click_button 'Sign In'
      end
      expect(page).to_not have_content 'Sign Out'
    end

  end


  describe "the signout process", :js => true, :type => :feature do
    before :each do
      User.create(:name => 'maria',
                :email => 'maria@maria.com', 
                :password => 'mariamaria',
                :password_confirmation => 'mariamaria')
    end

    it "allows a user to log out" do
      visit signin_path
      within('form') do
        fill_in 'session_email', :with => 'maria@maria.com'
        fill_in 'session_password', :with => 'mariamaria'
        click_button 'Sign In'
      end
      click_link 'Sign Out'
      expect(page).to have_content 'You just signed out.'
    end

  end

end
