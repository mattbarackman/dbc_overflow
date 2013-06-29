class AnswersController < ApplicationController

  before_filter :require_user, :only => [:new, :create]

  def new
    if session[:user_id]
      @question = Question.find(params[:question_id].to_i)
      @answer = Answer.new
      render :json => {:answer_template => render_to_string(:partial => 'new',
                                                            :locals => {:question => @question,
                                                                        :answer => @answer})}
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
      render :json => {:answer_template => render_to_string(:partial => 'shared/answer',
                                                            :locals => {:question => @question,
                                                                        :answer => @answer})}
    else
      flash[:error]= "Answer was not submitted"
      redirect_to question_path(@question)
    end
  end

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
    
  end

end
