require 'spec_helper'
require 'webmock/rspec'

describe Ping do
  
  context 'pinging external sites' do
    
    before :all do
      @user = FactoryGirl.create(:valid_user)
      @host = FactoryGirl.create(:valid_host, :owner_id=>@user.id)
    end
    
    it 'pings an external site and creates a record' do
      stub_request(:get, @host.url).
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'www.example-1.com', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: "", headers: {date: Time.now, server: 'Unicorn'})
      
      @ping = @host.pings.build.perform
      
      @ping.response_code.should eq(200)
      @ping.response_time.should >= 0.0
    end
    
    it 'handles timeouts properly' do
      stub_request(:get, @host.url).
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'www.example-1.com', 'User-Agent'=>'Ruby'}).
        to_timeout
      
      @ping = @host.pings.build.perform
      
      @ping.response_code.should eq(0)
      @ping.response_time.should eq(-1.0)
    end
    
  end
  
end
