require 'spec_helper'

describe AnswersController, :type => :feature do

  let(:user) { create(:user) }
  let!(:question) { create(:question) }
  let(:answer) { create(:answer, question: question, user: user) } 

  before do
    sign_in(user)
  end

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

    context "with valid attributes" do
      it "should save answer to database" do
        expect {
          post :create, question_id: question.id, answer: attributes_for(:answer) 
        }.to change(Answer, :count).by(1)
      end
      it "should redirect to answer show profile" do
        post :create, question_id: question.id, answer: attributes_for(:answer)
        response.should redirect_to(question_answers_path(question))
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) { attributes_for(:answer, question: question, user: user, content: "") }

      it "should not save answer to database" do
        expect { post :create, question_id: question.id, answer: invalid_attributes
              }.to_not change(Answer, :count).by(1)
      end
      it "should render the new form again" do
        post :create, question_id: question.id, answer: invalid_attributes
        response.should redirect_to(question_path(question))
      end
    end
  end

  describe "user login/answer" do

    it "can create answer if logged in" do
      expect { post :create, :question_id => question.id, answer: attributes_for(:answer) }.to change(Answer, :count).by(1)
    end
  end

  describe "user cannot answer question if not logged in" do
    it "cannot create answer if not logged in" do
      request.env['HTTP_REFERER'] = 'http://localhost:3000/sessions/new'
      sign_out
      expect { post :create, :question_id => question.id, answer: attributes_for(:answer) }.to_not change(Answer, :count).by(1) 
    end
  end

end
