class SessionsController < ApplicationController
  def new
    redirect_to home_path if signed_in?
  end

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice]    = 'You are signed in, enjoy!'
      redirect_to home_path
    else
      flash.now[:error] = 'Invalid username or password.'
      render :new
    end
  end

  def destroy
    flash[:notice]    = 'You have signed out.'
    session[:user_id] = nil
    redirect_to root_path
  end
end
