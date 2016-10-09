class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    @current_user ||= RegisteredUser.find_by(id: session[:registered_user_id])
  end

  def is_admin
    unless @current_user.user_type_id == 1
      flash[:danger] = "Credentials Invalid"
      redirect_to '/'
    end
  end

  def is_biz_user
    unless @current_user.user_type_id == 1 || @current_user.user_type_id == 2
      flash[:danger] = "Credentials Invalid"
      redirect_to '/'
    end
  end
end
