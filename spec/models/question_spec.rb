require "spec_helper"

describe Question do
  
  question = FactoryGirl.create(:question)
  question2 = FactoryGirl.build(:question)

  it "has a title upon initialization" do
    expect(question.title).to eq('EE hurts your soul.')
  end

  it "does not have duplicate title" do
    question2.save
    question2.id == nil
  end

  it "has a user associated to each question" do
    expect(question).to respond_to(:user)
  end

  it "has a tag" do
    pending
  end

  it "can have multiple tags" do
    pending
  end

end
