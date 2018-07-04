class UsersController < ApplicationController
  def new
    redirect_to home_path if signed_in?
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice]    = 'You have signed up.'
      session[:user_id] = @user.id
      redirect_to videos_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
