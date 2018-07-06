# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def require_user
    redirect_to sign_in_path unless signed_in?
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  def signed_in?
    !!current_user
  end
end
