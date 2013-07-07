class SessionsController < ApplicationController
  
  skip_before_filter :user_required
  skip_before_filter :verify_authenticity_token
  
  def create
    if @user = User.find_by_omniauth_uid(auth_hash['uid'])
      session[:user_id] = @user.id
      cookies.permanent[:remember_me] = @user.remember_me_token
      redirect_to root_path
    else
      session[:omniauth_uid] = auth_hash['uid']
      redirect_to new_user_path
    end
  end
  
  def failure
    # ...
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end
  
private
  
  def auth_hash
    request.env['omniauth.auth']
  end
  
end
