class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :user_required
  
  def current_user
    if user = User.find_by_id(session[:user_id]) || User.find_by_remember_me_token(cookies[:remember_me])
      return user
    end
    session[:user_id] = nil
    return false
  end
  helper_method :current_user
  
  def user_required
    current_user || redirect_to(welcome_path)
  end
  
end
