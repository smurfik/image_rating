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
    if current_user.notification
      current_user.notification = false
    else
      current_user.notification = true
    end
    current_user.save
    ImageMailer.subscribe(current_user.id).deliver_now if current_user.notification
    redirect_to account_path, notice: "Email settings updated!"
  end

  def update_email
    current_user.email = params[:user][:email]
    if current_user.save
      redirect_to account_path, notice: "Email was updated!"
    else
      @user = current_user
      render :account
    end
  end

end
