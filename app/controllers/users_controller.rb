# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :require_user, only: [:show]

  def new
    redirect_to home_path if signed_in?
    @user = User.new
  end

  def create
    # params.permit!
    @user = User.new user_params
    result = UserSignup.new(@user).sign_up(params[:stripeToken], params[:invitation_token])
    if result.successful?
      flash[:success]   = 'Thank you for registering with MyFlix.'
      session[:user_id] = @user.id
      redirect_to videos_path
    else
      flash[:error] = result.error_message
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def new_with_invitation_token
    invitation = Invitation.find_by(token: params[:token])
    if invitation
      @invitation_token = invitation.token
      @user             = User.new email: invitation.recipient_email
      render :new
    else
      redirect_to expired_token_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
end
