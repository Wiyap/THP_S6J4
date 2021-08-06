class SessionsController < ApplicationController
  def new
    @sessions = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      remember(user)
      flash[:success] = 'Youuhouuuu'
      redirect_to gossips_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to gossips_path
  end

