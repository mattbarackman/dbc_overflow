require 'spec_helper'

describe Answer do

  let(:question) { create(:question) }
  let(:answer) { create(:answer) }

  describe "accessible attributes" do
    it "should respond to answer attribute" do
      expect(answer).to respond_to(:content)
    end
  end

  describe "valid answer" do
    it "should not be blank" do
      invalid_answer = build(:answer, :content => "")
      expect(invalid_answer).to_not be_valid
    end
  end

  describe "associations" do
    # it "should belong to question" do
    #   t = Answer.reflect_on_association(:question)
    #   t.macro.should == :belongs_to 
    # end
    it { should belong_to(:question)}
  end
end
