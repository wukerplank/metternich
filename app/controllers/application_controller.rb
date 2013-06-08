class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :user_required
  
  def current_user
    if session[:user_id]
      return @current_user ||= User.find(session[:user_id])
    end
    return false
  end
  helper_method :current_user
  
  def user_required
    current_user || redirect_to(welcome_path)
  end
  
end
