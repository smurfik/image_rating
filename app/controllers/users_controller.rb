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
    redirect_to root_path
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

  def account
    @user = User.new
  end

  def update
    @user = current_user
    if @user.notification
      @user.notification = false
    else
      @user.notification = true
    end
    @user.save
    ImageMailer.subscribe(@user.id).deliver_now if @user.notification
    redirect_to account_path, notice: "Email settings updated!"
  end

  def update_email
    @user = current_user
    @user.email = params[:user][:email]
    if @user.save
      redirect_to account_path, notice: "Email was updated!"
    else
      render :account
    end
  end

end
