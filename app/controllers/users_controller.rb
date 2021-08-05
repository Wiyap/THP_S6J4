class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to gossips_path
    else
      flash[:danger] = 'Invalid email/password combination! Ou autres chose démerde toit j\'ai la flemme'
      render :new
    end
    puts @new_user.errors.messages
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password, :password_confirmation)
  end
end
