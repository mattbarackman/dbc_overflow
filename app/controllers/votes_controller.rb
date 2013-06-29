class VotesController < ApplicationController


  def create
    vote = Vote.find_or_create_by_user_id_and_voteable_id_and_voteable_type(voteable_type: params[:voteable_type],
                voteable_id: params[:voteable_id],
                user_id: current_user.id)
    vote_value = 1 if params[:value] == "1"
    vote_value = -1 if params[:value] == "-1"
    vote.update_attributes(value: vote_value)

    post = params[:voteable_type].classify.constantize.find(params[:voteable_id])
    vote.save
    render :json => post.sum_votes.to_json
  end
end
