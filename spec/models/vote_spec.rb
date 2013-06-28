require 'spec_helper'

describe Vote do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }

  before(:each) do
    @vote = user.votes.build(:question_id => question.id, :user_id => user.id, :question_id => question.id)
  end

  describe "attributes" do

    it "should respond_to user" do
      expect(@vote).to respond_to(:user)
    end

    it "should respond to question" do
      expect(@vote).to respond_to(:question)
    end

  end

  describe "validations" do

    before { @vote.user_id = "" }

    it "should not allow us to create a vote without a user_id" do
      @vote.should_not be_valid
    end

    it "should not allow us to create a vote without a question_id" do
      @vote.should_not be_valid
    end
  end
end
