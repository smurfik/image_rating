class UsersController < ApplicationController

  def sign_up
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome!"
    else
      render :sign_up
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_path, notice: "See you soon!"
  end

end
