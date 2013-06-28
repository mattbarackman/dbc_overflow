class AnswersController < ApplicationController

  before_filter :require_user, :only => [:new, :create]

  def new
    p params
    p session[:user_id]
    if session[:user_id]
      @question = Question.find(params[:question_id].to_i)
      p @question
      @answer = Answer.new
      # debugger
    else
      flash[:notice] = "Please log in first."
      redirect_to question_path(@question)
    end
  end

  def create
    @answer = Answer.new(params[:answer])
    @question = Question.find(params[:question_id])
    @answer.user_id = current_user.id
    @answer.question = @question
    if @answer.save
      redirect_to question_answers_path(@question)
    else
      flash[:error]= "Answer was not submitted"
      redirect_to question_path(@question)
    end
  end

  def index
    p params
    @question = Question.find(params[:question_id])
    
  end

end
