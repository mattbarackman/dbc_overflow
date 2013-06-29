require 'spec_helper'

describe AnswersController do

  let(:user) { create(:user) }
  let!(:question) { create(:question) }
  let(:answer) { create(:answer, question: question, user: user) } 

  describe "GET #index" do
    it "gets all the answers" do
      get :index, :question_id => question.id
      expect(question.answers).to eq([answer])
      assigns(:answers).should eq([answer])
    end
    it "renders the index view" do
      get :index, :question_id => question.id
      response.should render_template :index
    end
  end

  describe "GET #new" do

    before do
      session[:user_id] = user.id
    end

    it "assigns new answer to @answer" do
      get :new, :question_id => question.id
      assigns(:answer).should be_an_instance_of(Answer)
    end
    it "renders the form view" do
      get :new, :question_id => question.id
        response.should render_template :new
    end
  end

  describe "POST #create" do

    before do
      session[:user_id] = user.id
    end

    context "with valid attributes" do
      it "should save answer to database" do
        expect {
          post :create, question_id: question.id, answer: attributes_for(:answer) 
        }.to change(Answer, :count).by(1)
      end
      it "should redirect to answer show profile" do
        post :create, question_id: question.id, answer: attributes_for(:answer)
        p "*********************************************************"
        p post
        p answer
        response.should render_template :index
      end
    end

    context "with invalid attributes" do
      xit "should not save answer to database" do
        invalid_answer = build(:answer, :answer => "")
        expect {
          post :create, invalid_answer: attributes_for(:answer) 
        }.to_not change(Answer, :count).by(1)
      end
      xit "should render the new form again" do
        invalid_answer = build(:answer, :answer => "")
        post :create, invalid_answer: attributes_for(:answer)
        response.should render_template :new
      end
    end
  end


  # describe "user login/answer" do
  #   xit "can create answer if logged in" do
  #     sign_in(user)
  #     expect { post :create, :question_id => question, answer: attributes_for(:answer) }.to change(Answer, :count).by(1)
  #   end
  # end

  # describe "user cannot answer question if not logged in" do
  #   xit "cannot create answer if not logged in" do
  #     sign_in(user)
  #     sign_out
  #     expect { post :create, :question_id => question, answer: attributes_for(:answer) }.to_not change(Answer, :count).by(1) 
  #   end
  # end

end
