# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ping do
    host_id 1
    response_code 1
    response_header "MyText"
    response_time 1.5
  end
end
