class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_path, :alert => "You don't have access to this!"
    else
      redirect_to new_user_session_path, :alert => 'You need to authorize first!'
    end
  end
end
