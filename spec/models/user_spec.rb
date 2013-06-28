require 'spec_helper'
 
describe User do
 
  let(:name)   { "Tom Jones" }
  let(:email)   { "tom@jones.com" }
  let(:password)   { "tomtom" }
  let(:user) { user1 = User.create(name: name, 
                               email: email)
               user1.password = password
               user1.password_confirmation = password
               user1.save
               user1
             }

 
  describe "#initialize" do
    it "requires a name" do
      expect(User.new(email:email, 
                       password: password,
                       password_confirmation: password).valid?).to be_false
    end

    it "requires a valid email" do
      expect(User.new(name: name,
                      email: "hi!", 
                      password: password,
                      password_confirmation: password).valid?).to be_false
    end

    it "requires a valid password" do
      expect(User.new(name: name,
                      email: email, 
                      password: "p",
                      password_confirmation: "p").valid?).to be_false
    end

    it "requires password to match password_confirmation" do
      expect(User.new(name: name,
                      email: email, 
                      password: password,
                      password_confirmation: "123456").valid?).to be_false
    end

    it "has a name" do
      expect(user.name).to_not be_nil
    end

    it "sets the name to the name passed in on initialize" do
      expect(user.name).to eq name
    end

    it "has an email" do
      expect(user.email).to_not be_nil
    end

    it "sets the email to the email passed in on initialize" do
      expect(user.email).to eq email
    end

    context "with valid password" do
      it "authenticates the user" do
        expect(user.authenticate(password)).to be user
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
