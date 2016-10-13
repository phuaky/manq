class StoresController < ApplicationController
  before_action :is_biz_user, only: [:index, :create, :new, :destroy]
  before_action :is_store_user, only: [:show, :edit, :update]

  def index
    if is_admin?
      @stores = Store.all
    elsif is_biz_user?
      @stores = Store.where(biz_user_id: @current_user.biz_user.id)
      @biz = BizUser.find(@current_user.biz_user.id)
      @total_stores = @biz.stores.count

      @total_customers = 0
      @total_waiting_customers = 0
      @wait_time = 0
      @biz.stores.each do |store|
        @total_customers += store.historical_customers.where(status_id: 4).count
        @total_waiting_customers += store.customers.count
        store.historical_customers.where(status_id: 4).each do |customer|
          @wait_time += customer.created_at - customer.time
        end
      end
      @wait_time = (@wait_time/[@total_customers,1].max/60).round(0)
    end
  end

  def show
    @store = Store.find(params[:id])
    if is_biz_user?
      if @current_user.biz_user.id != @store.biz_user_id
        redirect_to '/stores'
      end
    elsif is_store_user?
      if @current_user.store.id != @store.id
        redirect_to '/stores/'+@current_user.store.id.to_s
      end
    end
    @customers_in_queue = @store.customers.count
    total_time = 0
    max_time = 0
    @store.customers.each do |customer|
      wait_time = Time.now.utc - customer.created_at
      total_time += wait_time
      max_time = [max_time, wait_time].max
    end

    @average_time_in_queue_min = (total_time/[@customers_in_queue,1].max/60).round(0)
    @max_time_in_queue_min = (max_time/60).round(0)

    @customers = Customer.where(store_id: params[:id]).order(queue_no: :asc)
    # @late_customers = HistoricalCustomer.where(store_id: params[:id], status_id: 2).order(created_at: :asc)
    @historical_customers = HistoricalCustomer.where(store_id: params[:id]).select(:user_id).distinct
  end

  def new
    @store = Store.new
  end

  def create
    @registered_user = RegisteredUser.new(registered_user_params)
    @registered_user.user_type_id = 3
    if @registered_user.save!
      @store = Store.new(store_params)
      @store.registered_user_id = @current_user.id
      @store.biz_user_id = @current_user.biz_user.id

      uploaded_file = params[:store_picture].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)

      @store.store_picture = cloudnary_file['public_id']

      if @store.save!
        flash[:success] = "Successfully Created Store!"
        redirect_to '/stores'
      else
        flash[:danger] = "Register fail, please check your entries"
        redirect_to '/stores/new'
      end
    else
      flash[:danger] = "Register fail, please check your entries"
      redirect_to '/stores/new'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to '/stores/'+params[:id].to_s
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to '/stores'
  end

  # For heroku upload photo
  def path
    @tempfile.path
  end

  private

  def store_params
      params.require(:store).permit(:registered_user_id, :biz_user_id, :store_name, :store_address, :contact_person, :contact_no, :max_queue_no, :max_queue_allow, :max_leeway, :reservation_fee)
  end

  def registered_user_params
    params.require(:registered_user).permit(:email, :password, :password_confirmation)
  end
end
