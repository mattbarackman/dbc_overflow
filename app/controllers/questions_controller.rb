class QuestionsController < ApplicationController

  before_filter :load_current_user
  # before_filter :authorize, :except => [:index, :show]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    # REVIEW: should this be current_user, as long as they're authorized?
    # If we authorize the current_user correctly, then we can just do @question.user = current_user
    @question.user_id = params[:user_id]
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    # REVIEW: you don't need params[:id].to_i, just use params[:id]
    @question = Question.find(params[:id].to_i)
  end

  def show
    @question = Question.find(params[:id].to_i)
  end

  def update
    @question = Question.find(params[:id])
    # REVIEW: what happens if we the update is unsuccessful? then you just failed silently.
    # Your code should handle the happy and unhappy paths gracefully.
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
  # REVIEW: look in your application controller, you have a method that does something similar DRY.
  def authorize
    unless @user == current_user
      redirect_to root_path
      flash[:error] = "not authorized user"
    end
  end
end
