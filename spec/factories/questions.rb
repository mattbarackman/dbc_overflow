FactoryGirl.define do
  factory :question do
    title Faker::Lorem.sentence
    content "High five"
  end
end

