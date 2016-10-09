class SessionsController < ApplicationController
  def new
    @registered_user = RegisteredUser.new
  end

  def create
    registered_user = RegisteredUser.authenticate(user_params)

    if registered_user
      session[:registered_user_id] = registered_user.id
      flash[:success] = "Successfully Logged In!"
      redirect_to '/'
    else
      flash[:danger] = "Credentials Invalid!"
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:registered_user).permit(:email, :password)
  end
end
