class CustomersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.find_or_create_by!(user_params)
    
    redirect_to '/'

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:phone_no)
  end
end
