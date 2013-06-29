FactoryGirl.define do
  factory :answer do
    content "this is an answer"
    question
    user
  end
end
