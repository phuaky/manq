class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    @registered_user ||= RegisteredUser.find_by(id: session[:registered_user_id])
  end
end
