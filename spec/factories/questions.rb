FactoryGirl.define do
  factory :question do
    title Faker::Lorem.sentence
    content "High five"
    user
  end
end

