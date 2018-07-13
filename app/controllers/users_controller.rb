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

    if @user.save
      handle_invitation
      Stripe.api_key = ENV['stripe_api_key']
      token = params[:stripeToken]
      Stripe::Charge.create({
        amount:      999,
        currency:    'usd',
        description: "Sign up charge for #{@user.email}",
        source:      token,
      })
      ApplicationMailer.send_welcome_email(@user).deliver
      flash[:notice]    = 'You have signed up.'
      session[:user_id] = @user.id
      redirect_to videos_path
    else
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
