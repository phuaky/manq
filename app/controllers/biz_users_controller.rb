class BizUsersController < ApplicationController
  before_action :is_biz_user, only: [:index, :edit, :update, :show, :destroy]

  def index
    @biz_users = BizUser.all
  end

  def show
    @biz_user = BizUser.find(params[:id])
  end

  def new
    @biz_user = BizUser.new
  end

  def create
    @registered_user = RegisteredUser.new(registered_user_params)
    @registered_user.user_type_id = 2
    if @registered_user.save
      @biz_user = BizUser.new(biz_user_params)
      @biz_user.registered_user_id = @registered_user.id
      if @biz_user.save
        session[:registered_user_id] = @registered_user.id
        flash[:success] = "Business successfully registered!"
        redirect_to '/biz_users'
      else
        session[:registered_user_id] = nil
        flash[:danger] = "Register fail, please check your entries"
        redirect_to '/biz_users/new'
      end
    else
      # render :new
      session[:registered_user_id] = nil
      flash[:danger] = "Register fail, please check your entries"
      redirect_to '/biz_users/new'
    end
  end

  def edit
    @biz_user = BizUser.find(params[:id])
  end

  def update
    @biz_user = BizUser.find(params[:id])
    if @biz_user.update(biz_user_params)
      flash[:success] = "Business successfully updated!"
      redirect_to '/stores'
    end
  end

  def destroy
    @biz_user = BizUser.find(params[:id])
    @registered_user = RegisteredUser.find(@biz_user.registered_user_id)
    @registered_user.destroy
    @biz_user.destroy
    redirect_to '/biz_users'
  end

  private

  def registered_user_params
    params.require(:registered_user).permit(:email, :password, :password_confirmation)
  end

  def biz_user_params
    params.require(:biz_user).permit(:reg_no, :company_name, :address, :contact_person, :contact_no)
  end
end
