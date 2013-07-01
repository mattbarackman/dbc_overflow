require 'spec_helper'

describe UsersController do

  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.build(:user)}

  describe "the signup process", :js => false, :type => :feature do

    it "allows valid signups" do
      visit signup_path
      within('form') do
        fill_in 'user_name', :with => user2.name 
        fill_in 'user_email', :with => user2.email
        fill_in 'user_password', :with => user2.password
        fill_in 'user_password_confirmation', :with => user2.password
        click_button 'Create User'
      end
      expect(page).to have_content 'Welcome to DBC Overflow!'
    end

    it "does not allow invalid signups" do
      visit signup_path
      within('form') do
        fill_in 'user_name', :with => user1.name
        fill_in 'user_email', :with => user1.email
        fill_in 'user_password', :with => user1.password
        fill_in 'user_password_confirmation', :with => user1.password
        click_button 'Create User'
      end
      expect(page).to_not have_content 'Welcome to DBC Overflow!'
    end
  end
end
