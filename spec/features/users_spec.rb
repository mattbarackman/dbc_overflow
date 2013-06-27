require 'spec_helper'

describe UsersController do

  describe "the signup process", :js => true, :type => :feature do
    before :each do
      User.create(:name => 'maria',
        :email => 'maria@maria.com', 
        :password => 'mariamaria',
        :password_confirmation => 'mariamaria')
    end

    it "allows valid signups" do
      visit signup_path
      within('form') do
        fill_in 'user_name', :with => 'baria'
        fill_in 'user_email', :with => 'baria@maria.com'
        fill_in 'user_password', :with => 'mariamaria'
        fill_in 'user_password_confirmation', :with => 'mariamaria'
        click_button 'Create User'
      end
      expect(page).to have_content 'Welcome to DBC Overflow!'
    end

    it "does not allow invalid signups" do
      visit signup_path
      within('form') do
        fill_in 'user_name', :with => 'maria'
        fill_in 'user_email', :with => 'maria@maria.com'
        fill_in 'user_password', :with => 'mariamaria'
        fill_in 'user_password_confirmation', :with => 'mariamaria'
        click_button 'Create User'
      end
      expect(page).to_not have_content 'Welcome to DBC Overflow!'
    end
  end
end
