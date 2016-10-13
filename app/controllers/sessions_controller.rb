class SessionsController < ApplicationController
  def new
    @registered_user = RegisteredUser.new
  end

  def create
    registered_user = RegisteredUser.authenticate(user_params)

    if registered_user
      session[:registered_user_id] = registered_user.id
      flash[:success] = "Successfully Logged In!"
      if registered_user.user_type_id == 3
        redirect_to '/stores/' + registered_user.store.id.to_s
      elsif registered_user.user_type_id == 2
        redirect_to '/stores'
      else  registered_user.user_type_id == 1
        redirect_to '/'
      end
    else
      flash[:danger] = "Credentials Invalid!"
      redirect_to '/'

    end
  end

  def destroy
    session[:registered_user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:registered_user).permit(:email, :password)
  end
end
