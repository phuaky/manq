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

  def ajax
    id = User.where(phone_no: params[:phone_no])
    @customers = Customer.where(user_id: id)

    @customers.each do |customer|
      @store = Store.find(customer.store_id)
      @customers_in_queue = @store.customers.count
      # puts Customer.where(store_id: customer.store_id).count
      # puts Customer.where(store_id: customer.store_id).where('queue_no < ?', customer.queue_no).count
      total_time = 0
      max_time = 0
      @store.customers.each do |customer|
        wait_time =  Time.now.utc - customer.created_at
        total_time += wait_time
        max_time = [max_time, wait_time].max
      end
      @average_time_in_queue_min = (total_time/@customers_in_queue/60).round(0)
      @max_time_in_queue_min = (max_time/60).round(0)
      customer.id = @customers_in_queue #hack for storing the number of customers in queue
      customer.status_id = Customer.where(store_id: customer.store_id).where('queue_no < ?', customer.queue_no).count #hack for storing no of customers in front
      customer.user_id = @average_time_in_queue_min * customer.status_id #hack for storing the estimated wait time
    end

    respond_to do |format|
      format.json {
        render json: @customers, :include => {:store => {:include => {:biz_user => {:only => :company_name}}, :only => :store_name}}}
    end
  end

  private

  def user_params
    params.require(:user).permit(:phone_no)
  end
end
