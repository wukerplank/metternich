require 'net/http'

class Ping < ActiveRecord::Base
  
  belongs_to :host
  
  validates_presence_of :host_id, :response_code, :response_time
  
  serialize :response_header, Hash
  
  def perform
    uri = URI(self.host.url)
    
    start = Time.now
    
    begin
      res = Net::HTTP.get_response(uri)
    
      self.response_time = Time.now - start
      self.response_code = res.code
      self.response_header = res.to_hash
    rescue Timeout::Error
      self.response_time = -1.0
      self.response_code = 0
      self.response_header = {}
    end
    
    self.save!
    
    return self
  end
  
end
