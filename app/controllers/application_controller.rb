class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    @current_user ||= RegisteredUser.find_by(id: session[:registered_user_id])
  end

  def is_admin
    unless @current_user
      flash[:danger] = "Credentials Invalid"
      redirect_to '/'
    else
      unless @current_user.user_type_id == 1
        flash[:danger] = "Credentials Invalid"
        redirect_to '/'
      end
    end
  end

  def is_admin?
    if @current_user.user_type_id == 1
      return true
    else
      return false
    end
  end

  def is_biz_user
    unless @current_user
      flash[:danger] = "Credentials Invalid"
      redirect_to '/'
    else
      unless @current_user.user_type_id == 1 || @current_user.user_type_id == 2
        flash[:danger] = "Credentials Invalid"
        redirect_to '/'
      end
    end
  end

  def is_biz_user?
    if @current_user.user_type_id == 2
      return true
    else
      return false
    end
  end

  def is_store_user
    unless @current_user
      flash[:danger] = "Credentials Invalid"
      redirect_to '/'
    else
      unless @current_user.user_type_id == 1 || @current_user.user_type_id == 2 || @current_user.user_type_id == 3
        flash[:danger] = "Credentials Invalid"
        redirect_to '/'
      end
    end
  end

  def is_store_user?
    if @current_user.user_type_id == 3
      return true
    else
      return false
    end
  end

  def sms recipient_no, message
    account_sid = "AC6b5d5cde4eeaa56581da7cd359e4ce07" # Your Account SID from www.twilio.com/console
    auth_token = "d78af85228d57437e4eb632d46468d66"   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => '+61439877373',
      :to => recipient_no,
      :body => message,
    })
  end
end
