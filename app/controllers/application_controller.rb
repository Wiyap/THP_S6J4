class ApplicationController < ActionController::Base
  add_flash_types :info, :danger, :warning, :success
  
  def current_user
    User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    redirect_to new_session_path unless !session[:user_id].nil?
  end

  def already_liked?
    !Like.where(gossip_id:params[:id],user_id:session[:user_id]).nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end


  def remember(user)
    remember_token = SecureRandom.urlsafe_base64  
    user.remember(remember_token)
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  end
end
