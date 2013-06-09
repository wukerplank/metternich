# require 'spec_helper'
# 
# describe 'Hosts' do
#   
#   context 'overview' do
#     
#     before :all do
#       @user = FactoryGirl.create(:valid_user)
#       @host = FactoryGirl.create(:valid_host, :owner_id=>@user.id)
#     end
#     
#     before :each do
#       visit root_path
#       
#       puts current_path
#       
#       click_link 'signin'
#       
#       puts current_path
#     end
#     
#     it 'displays successful pings properly' do
#       mock_auth_hash(@user)
#         
#       puts User.all.inspect
#       
#       save_and_open_page
#     end
#     
#     it 'displays failed pings properly' do
#       
#     end
#     
#     it 'diplays timed out pings properly' do
#       
#     end
#     
#   end
#   
# end