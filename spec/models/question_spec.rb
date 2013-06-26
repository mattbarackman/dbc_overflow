require "spec_helper"

describe Question do

  let(:title)   {"What is this crazy EE thing here at DBC?"}
  let(:content) {"I've heard a lot about it but don't really understand what is covered"}
  let(:bob) {mock(:user, :name=>"Bob Marley", :id=> 1)}
  let(:question) {Question.new(title: title, content: content, user_id: bob.id)}

  describe "#index" do
    it "should return all questions related to user from database" do
      visit '/users/1/questions'
      expect(page).to have_content question.title
    end
  end      





























end
