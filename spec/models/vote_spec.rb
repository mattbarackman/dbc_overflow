require 'spec_helper'

describe Vote do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:question) { FactoryGirl.create(:question) }

  before(:each) do
    @vote = user.votes.build(:voteable_id => question.id, voteable_type: "Question", :user_id => user.id)
  end

  describe "attributes" do

    it "should respond_to user" do
      expect(@vote).to respond_to(:user)
    end

    it "should respond to voteable" do
      expect(@vote).to respond_to(:voteable)
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
