# app/controllers/password_resets_controller.rb

class PasswordResetsController < ApplicationController
  def show
    user = User.find_by token: params[:id]
    if user
      @token = user.token
    else
      redirect_to expired_token_path
    end
  end

  def expired_token
  end

  def create
    user = User.find_by token: params[:token]
    if user
      user.password = params[:password]
      user.generate_token
      user.save
      flash[:success] = 'Your password has been changed. Please sign in.'
      redirect_to sign_in_path
    else
      redirect_to expired_token_path
    end
  end
end
