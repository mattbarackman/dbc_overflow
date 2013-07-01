require 'spec_helper'

describe User do

  let(:name)   { "Tom Jones" }
  let(:email)   { "tom@jones.com" }
  let(:password)   { "tomtom" }
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.build(:user, password_confirmation: "hey") }

  describe "#initialize" do
    it "requires a name" do
      should validate_presence_of(:name)
    end

    it "will not allow an invalid email" do
      should_not allow_value("blah").for(:email)
    end

    it "will allow valid email" do
      should allow_value("blah@blah.com").for(:email)
    end

    it "won't allow a password less than 5 letters" do
      should_not allow_value("blah").for(:password)
    end

    it "allows a password that is more than 5 letters" do
      should allow_value("blahbla").for(:password)
    end

    it "requires password to match password_confirmation" do
      expect(user2.valid?).to be_false
    end

    context "with valid password" do
      it "authenticates the user" do
        expect(user.authenticate(user.password)).to be user
      end
    end

    context "with incorrect password" do
      it "does not authenticate the user" do
        expect(user.authenticate("incorrect_password")).to be_false
      end
    end
  end

  describe "voting and questions" do
    let(:other_user) { FactoryGirl.create(:user) }
    let(:question) { FactoryGirl.create(:question) }
    
    context "upvote" do

      it "should increase the users vote count" do
        expect{ other_user.upvote!(question)}.to change{other_user.votes.count}.from(0).to(1)
      end

      it "should increase the questions vote count" do
        expect{ other_user.upvote!(question)}.to change{question.votes.count}.from(0).to(1)
      end
    end

    # context "downvote" do
    #   it "should decrease the user's vote count" do
    #     expect { other_user.downvote!(question) }.to change{user.votes.count}.by(1)
    #   end
    # end
  end
end
