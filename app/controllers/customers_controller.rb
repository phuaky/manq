class CustomersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.find_or_create_by!(user_params)
    @customer = Customer.new(store_id: params[:store_id])
    @customer.user_id = @user.id
    queue = Customer.where(store_id: params[:store_id]).maximum('queue_no') + 1
    @customer.queue_no = queue
    @customer.status_id = 1
    if @customer.save!
      redirect_to '/'
    else
      redirect_to '/'
    end

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
