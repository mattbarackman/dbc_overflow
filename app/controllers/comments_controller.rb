class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    p params
    @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
  end

  def create
    p params
    @comment = Comment.new(params[:comment])
    p current_user.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @comment.parent
      # render :json => {:comment_template => render_to_string(:partial => 'shared/answer',
      #                                                        :locals => {:commentable => @comment,
      #                                                                    :comment => @comment})}
    else
      @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
      render :new
      # render :status => :bad_request
    end 
  end

  def edit
    @comment = Comment.update_attributes(params[:comment])
    if @comment.save
      redirect_to @comment
    else
      @commentable = @comment.commentable_type.constantize.find(@comment.id)
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
