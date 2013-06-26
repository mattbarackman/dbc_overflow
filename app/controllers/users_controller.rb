class UsersController < ApplicationController

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
      redirect_to user_path(@user.id)
      # redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    User.destroy(params[:id])
    redirect_to new_user_path
  end

end
