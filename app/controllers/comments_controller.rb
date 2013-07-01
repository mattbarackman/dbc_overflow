class CommentsController < ApplicationController

  def new
    if session[:user_id]    
      @comment = Comment.new
      @commentable = params[:commentable_type].constantize.find(params[:commentable_id])
      render :json => {:comment_template => render_to_string(:partial => 'new',
                                                            :locals => {:commentable => @commentable,
                                                                        :comment => @comment})}
    else
      flash[:notice] = "Please log in first."
      redirect_to @commentable
    end
  end

  def create
    p params
    @comment = Comment.new(params[:comment])
    p current_user.id
    @comment.user_id = current_user.id
    if @comment.save
      render :json => {:comment_template => render_to_string(:partial => 'shared/comment',
                                                             :locals => {:commentable => @comment,
                                                                         :comment => @comment})}
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


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

end
