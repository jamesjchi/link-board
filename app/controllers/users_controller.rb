class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Name Must Be Less than 20 Characters"
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
