class SessionsController < ApplicationController
  
  skip_before_filter :user_required
  skip_before_filter :verify_authenticity_token # FIXME workaround => should not be needed
  
  def create
    unless (Rails.env.production? && @user = User.find_by_twitter_uid(auth_hash['uid'])) || @user = User.find_by_twitter_uid(auth_hash['name'])
      @user = User.create(
        :nickname => (user_info['nickname'].present? ? user_info['nickname'] : user_info['name'])
      )
      @user.save
    end
    session[:user_id] = @user.id
    
    redirect_to root_path
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end
  
private
  
  def auth_hash
    request.env['omniauth.auth']
  end
  
  def user_info
    auth_hash['user_info'] || auth_hash['info']
  end
  
end
