class StoresController < ApplicationController
  before_action :is_biz_user, only: [:index, :create, :new, :destroy]
  before_action :is_store_user, only: [:show, :edit, :update]

  def index
    if is_admin?
      @stores = Store.all
    elsif is_biz_user?
      puts @current_user.biz_user.id
      # @stores = Store.all
      @stores = Store.where(biz_user_id: @current_user.biz_user.id)
    end
  end

  def show
    @store = Store.find(params[:id])
    @customers_in_queue = @store.customers.count
    total_time = 0
    max_time = 0
    @store.customers.each do |customer|
      wait_time =  Time.now.utc - customer.created_at
      total_time += wait_time
      max_time = [max_time, wait_time].max
    end
    @average_time_in_queue_min = (total_time/@customers_in_queue/60).round(0)
    @max_time_in_queue_min = (max_time/60).round(0)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
