# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    nickname "MyString"
    twitter_uid "MyString"
    twitter_hash "MyText"
  end
end
