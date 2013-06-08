class User < ActiveRecord::Base
  
  has_many :hosts, foreign_key: 'owner_id'
  
end
