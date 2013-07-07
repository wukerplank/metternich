class UsersController < ApplicationController
  
  skip_before_filter :user_required, :only=>[:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.omniauth_uid = session[:omniauth_uid]
    if @user.save
      session[:user_id] = @user.id
      cookies.permanent[:remember_me] = @user.remember_me_token
      redirect_to root_path
    else
      puts @user.errors.inspect
      render :action => 'new'
    end
  end
  
protected
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
  
end
