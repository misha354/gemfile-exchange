class SessionsController < ApplicationController

  def create
    user = User.find_by username: params[:username]

    if user && user.authenticate(params[:password])
      login_user!(user) 
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with your username "
      redirect_to login_path
    end
  end

  def login_user!(user)
    session[:user_id] = user.id
    flash[:notice] = 'You have succesfully logged in.'
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to root_path
  end
end