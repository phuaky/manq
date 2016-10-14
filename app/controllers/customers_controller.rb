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
    queue = [Customer.where(store_id: params[:store_id]).maximum('queue_no'),0].max + 1
    @customer.queue_no = queue
    @customer.status_id = 1
    if @customer.save!
      sms('+65'+@user.phone_no.to_s,'Your queue number for '+@customer.store.biz_user.company_name+' - '+@customer.store.store_name+' is #'+@customer.queue_no.to_s+'.')
      flash[:success] = "You have joined the queue!"
      redirect_to '/'
    else
      flash[:danger] = "Error joining queue.. Pls try again"
      redirect_to '/'
    end

  end

  def edit
  end

  def update
    if params[:type] == 'update'
      @old_record = Customer.find(params[:customer_id])
      # Do not do anything if the new status selected is same as old status
      unless @old_record.status_id == Status.where(status_type: params[:status]).take.id
        @new_record = HistoricalCustomer.new
        @new_record.user_id = @old_record.user_id
        @new_record.store_id = @old_record.store_id
        @new_record.queue_no = @old_record.queue_no
        @new_record.status_id = Status.where(status_type: params[:status]).take.id
        @new_record.time = @old_record.created_at
        if @new_record.save!
          @old_record.destroy
          @customers = Customer.where(store_id: @new_record.store_id).order(queue_no: :asc).limit(3)
          @third_customer = @customers[2]
          puts @third_customer.queue_no
          sms('+65'+@third_customer.user.phone_no.to_s,'From: '+@third_customer.store.biz_user.company_name+' - '+@third_customer.store.store_name+'. You are now third in line.')
        end
      end
    elsif params[:type] == 'change' && params[:status] == 'waiting'
      @old_record = HistoricalCustomer.find(params[:customer_id])
      @new_record = Customer.new
      @new_record.user_id = @old_record.user_id
      @new_record.store_id = @old_record.store_id
      @new_record.queue_no = @old_record.queue_no
      @new_record.status_id = 1
      @new_record.created_at = @old_record.time
      if @new_record.save!
        @duplicate_records = HistoricalCustomer.where(user_id: @new_record.user_id)
        @duplicate_records.each do |duplicate_record|
        duplicate_record.destroy
        end
      end
    elsif params[:type] == 'change'
      @old_record = HistoricalCustomer.find(params[:customer_id])
      @new_record = HistoricalCustomer.new
      @new_record.user_id = @old_record.user_id
      @new_record.store_id = @old_record.store_id
      @new_record.queue_no = @old_record.queue_no
      @new_record.status_id = Status.where(status_type: params[:status]).take.id
      @new_record.time = @old_record.created_at
      unless @old_record.status_id == @new_record.status_id
        if @old_record.status_id == 3 || @old_record.status_id == 4
          @old_record.destroy
          @new_record.save!
          until HistoricalCustomer.where(user_id: @new_record.user_id, status_id: @new_record.status_id).count < 2 do
            @duplicate_record = HistoricalCustomer.where({user_id: @new_record.user_id, status_id: @new_record.status_id}).order(time: :desc).take
            @duplicate_record.destroy
          end
        else
          @new_record.save!
          until HistoricalCustomer.where(user_id: @new_record.user_id, status_id: @new_record.status_id).count < 2 do
            @duplicate_record = HistoricalCustomer.where({user_id: @new_record.user_id, status_id: @new_record.status_id}).order(time: :desc).take
            @duplicate_record.destroy
          end
        end
      end
    end
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
      @average_time_in_queue_min = (total_time/[@customers_in_queue,1].max/60).round(0)
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
