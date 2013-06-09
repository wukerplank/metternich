# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :valid_ping, :class=>Ping do
    host_id 0
    response_code 200
    response_header {}
    response_time 0.8
  end
end
