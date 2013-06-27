class VotesController < ApplicationController

  before_filter :require_login

  def create
    @question = Question.find(params[:vote][:question_id])
    current_user.upvote!(@question)
    respond_to do |format|
      format.json  { render :json => @question.votes.count }
    end
  end
end