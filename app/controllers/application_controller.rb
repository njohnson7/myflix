class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    redirect_to '/videos' unless session[:user_id].blank?
  end
end
