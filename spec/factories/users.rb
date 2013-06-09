# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :valid_user, :class=>User do
    sequence(:nickname){|n| "nickname_#{n}"}
    sequence(:twitter_uid){|n| "XXXXXX#{n}"}
    twitter_hash {}
  end
end
