require 'net/http'

class Ping < ActiveRecord::Base
  
  belongs_to :host
  
  validates_presence_of :host_id, :response_code, :response_header, :response_time
  
  serialize :response_header, Hash
  
  def perform
    uri = URI(self.host.url)
    
    start = Time.now
    res = Net::HTTP.get_response(uri)
    self.response_time = Time.now - start
    self.response_code = res.code
    self.response_header = res.to_hash
    
    self.save!
  end
  
end
