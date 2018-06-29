class ApplicationController < ActionController::Base
  # added
  protect_from_forgery with: :exception

  # from demyst
  # protect_from_forgery prepend: true
end
