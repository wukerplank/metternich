class Host < ActiveRecord::Base
  
  validates_presence_of :url, :enabled, :interval
  
  has_many :pings
  
  def last_ping
    @last_ping ||= self.pings.order('created_at ASC').last
  end
  
end
