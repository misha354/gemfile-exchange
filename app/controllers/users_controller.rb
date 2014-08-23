class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update]
  before_action :find_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'You have successfully registered.'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your profile was updated.'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @gemfiles = user.gemfiles
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find params[:id]
  end

end