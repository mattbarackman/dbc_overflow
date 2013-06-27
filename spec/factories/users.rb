FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "foo_#{n}@bar.com"}
    password "foobar"
  end
end