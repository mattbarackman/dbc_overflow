class VotesController < ApplicationController

  def create
    @question = Question.find(params[:vote][:question_id])
    current_user.upvote!(@question)
    respond_to do |format|
      format.json  { render :json => @question.votes.count }
    end
  end

  def destroy
    @question = Question.find(params[:vote][:question_id])
    current_user.downvote!(@question)
    respond_to do |format|
      format.json  { render :json => @question.votes.count }
    end
  end
end