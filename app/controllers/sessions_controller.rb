class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate user_params[:email], user_params[:password]

    if @user 
      session[:user_id] = @user.id
      flash[:success] = "User Logged In!"
      redirect_to root_path
    else 
      flash[:danger] = "Invalid Input"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User Logged Out"
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end