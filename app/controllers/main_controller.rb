class MainController < ApplicationController
  def index
    @stores = Store.all
    # @store = Store.find(params[:id])
    # @customers_in_queue = @store.customers.count
    # total_time = 0
    # max_time = 0
    # @store.customers.each do |customer|
    #   wait_time =  Time.now.utc - customer.created_at
    #   total_time += wait_time
    #   max_time = [max_time, wait_time].max
    # end
    # @average_time_in_queue_min = (total_time/@customers_in_queue/60).round(0)
    # @max_time_in_queue_min = (max_time/60).round(0)

  end
end
