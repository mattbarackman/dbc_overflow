class UsersController < ApplicationController

  before_filter :require_user, only: [:edit, :update, :destroy]
  before_filter :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to DBC Overflow!"
      sign_in(@user)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user
  end

  def edit
    @user
  end

  def update
    if @user.update_attributes(params[:user])
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

  private

  def find_user
    @user = User.find(params[:id])
  end

end
