class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  #TODO: decide where user will be redirecting to
  #  rescue_from CanCan::AccessDenied do |exception|
  #  end
end
