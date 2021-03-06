class QuestionsController < ApplicationController
  

  before_filter :load_current_user
  before_filter :authorize, :except => [:index, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def show
    @question = Question.find(params[:id])
    @comments = @question.comments.order("created_at DESC")
    @answers = @question.answers.order("created_at DESC")
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to @question
    else
      flash[:errors] = ["Your question was not updated"]
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def winner
    question = Question.find(params[:question_id])
    question.winner = params[:winner_id]
    question.save
    render :json => (question.user == current_user).to_json
    # render :json => owner(question).to_json
  end

  private

  def load_current_user
    @user = current_user
  end

  def authorize
    require_user(root_path)
    # unless @user == current_user
    #   redirect_to root_path
    #   flash[:error] = "not authorized user"
    # end
  end
end
