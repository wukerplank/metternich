# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :valid_host, :class=>'Host' do
    sequence(:url){|n| "http://www.example-#{n}.com"}
    owner_id 0
  end
end
