class VotesController < ApplicationController


  def create
    @resource = params[:vote][:resource]
    if @resource == "Answer"
      @record = Answer.find(params[:vote][:id])
    else
      @record = Question.find(params[:vote][:id])
    end
    current_user.upvote!(@record)
    respond_to do |format|
      format.json  { render :json => @record.votes.count }
    end
  end
end