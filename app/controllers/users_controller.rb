class UsersController < ApplicationController

  before_filter :require_user, only: [:edit, :update, :destroy]

  # REVIEW: you're not using this action, remove it.
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to DBC Overflow!"
      sign_in(@user)
      # REVIEW: you don't need to call @user.id, you can jsut do: user_path(@user)
      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    # REVIEW: this line repeats several times in this controller? move it to a before_filter.
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # REVIEW: update_attributes saves for you, if it does it will return true,
    # so: if @user.update_attributes(params[:user]) will do the job, no need to call save.
    @user.update_attributes(params[:user])

    if @user.save
      flash[:success] = "Your profile has been edited!"
      redirect_to user_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end

  end

  def destroy
    sign_out
    User.destroy(params[:id])
    redirect_to new_user_path
  end

end
