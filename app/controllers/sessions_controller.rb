class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where('email = ?', params[:email])[0]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice]    = 'You have logged in.'
      redirect_to root_path
    else
      flash[:error] = 'Problem with username or password.'
      render :new
    end
  end

  def destroy
    flash[:notice]    = 'You have logged out.'
    session[:user_id] = nil
    redirect_to root_path
  end
end
