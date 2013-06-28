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
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id].to_i)
  end

  def show
    @question = Question.find(params[:id].to_i)
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  private

  def load_current_user
    @user = current_user
  end

  def authorize
    unless @user == current_user
      redirect_to root_path
      flash[:error] = "not authorized user"
    end
  end
end
