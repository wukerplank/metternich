class SessionsController < ApplicationController
  
  skip_before_filter :user_required
  skip_before_filter :verify_authenticity_token # FIXME workaround => should not be necessary, seems to be a bug in Rails 4.beta
  
  def create
    unless (Rails.env.production? && @user = User.find_by_twitter_uid(auth_hash['uid'])) || @user = User.find_by_twitter_uid(user_info['name'])
      @user = User.create(
        :nickname     => (Rails.env.production? ? user_info['nickname'] : user_info['name']),
        :twitter_uid  => (Rails.env.production? ? auth_hash['uid']      : user_info['name']),
        :twitter_hash => auth_hash.to_yaml
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
    logger.info request.env['omniauth.auth'].inspect
    request.env['omniauth.auth']
  end
  
  def user_info
    logger.info (auth_hash['user_info'] || auth_hash['info']).inspect
    auth_hash['user_info'] || auth_hash['info']
  end
  
end
