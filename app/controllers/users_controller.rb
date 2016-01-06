class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to photos_path, notice: "Welcome!"
    else
      render :sign_up
    end
  end

  def sign_out
    session.delete(:user_id)
    redirect_to root_path, notice: "See you soon!"
  end

  def sign_in
    @user = User.new
  end

  def sign_in_user
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to photos_path, notice: "Welcome back!"
    else
      redirect_to sign_in_path, notice: "Wrong username or password, try again!"
    end
  end

end
