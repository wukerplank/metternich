require 'spec_helper'

describe 'Signin' do
  
  context 'sign in / sign up via twitter' do
    
    it 'lets a use sign up via twitter' do
      old_user_count = User.count
      
      visit root_path
      
      page.should have_content("Sign in via Twitter")
      
      @user = FactoryGirl.build(:valid_user)
      
      mock_auth_hash(@user)
      
      click_link 'signin'
      
      page.should have_content(@user.nickname)
      page.should have_content("Sign out")
      
      User.count.should eq(old_user_count+1)
    end
    
    it "can handle authentication error" do
      old_user_count = User.count
      
      visit root_path
      
      page.should have_content("Sign in via Twitter")
      
      OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
      
      click_link "signin"
      
      page.should have_content('Authentication failed.')
      
      User.count.should eq(old_user_count)
      
      pending "test passes although it shouldn't"
    end
    
  end
  
end
