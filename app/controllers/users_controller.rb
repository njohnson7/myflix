# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :require_user, only: [:show]

  def new
    redirect_to home_path if signed_in?
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.valid?
      Stripe.api_key = ENV['stripe_api_key']
      charge = StripeWrapper::Charge.create(
        amount:      999,
        description: "Sign up charge for #{@user.email}",
        source:      params[:stripeToken],
      )
      if charge.successful?
        @user.save
        handle_invitation
        ApplicationMailer.send_welcome_email(@user).deliver
        flash[:success]   = 'Thank you for registering with MyFlix.'
        session[:user_id] = @user.id
        redirect_to videos_path
      else
        flash[:error] = charge.error_message
        render :new
      end
    else
      flash[:error] = 'Invalid user information. Please check the errors below.'
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

  def handle_invitation
    if params[:invitation_token].present?
      invitation = Invitation.find_by token: params[:invitation_token]
      @user.follow invitation.inviter
      invitation.inviter.follow @user
      invitation.update_column :token, nil
    end
  end
end
