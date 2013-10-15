class Shop::OrdersController < Shop::ShopController

  respond_to :html, :js

  def new
    puts "\nOC#new: cart:#{@cart.inspect}, cart items: #{@cart.items.inspect}\n"
    if @cart.empty?
      redirect_to shop_url, notice: 'Your cart is empty'
      return
    end

    @order = Shop::Order.new

    respond_with @order
  end

  def create
    @order = Shop::Order.new(order_params)

    @order.add(@cart.items.with_product)
    if current_user.nil?
      @order.user = User.create(user_email_param)
      @order.address = Address.create(order_address_params) unless order_address_params.nil?
      @order.user.addresses << @order.address
      # TODO Email login information
    else
      @order.user = current_user
      @order.address = Address.find_or_create(user_address_param) unless user_address_param.nil?
    end

    respond_to do |format|
      if @order.save
        @cart.destroy
        session[:cart_id] = nil
        # TODO Email order confirmation
        format.html { redirect_to shop_url, notice: 'Thank you for your order.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: 'Failure' }
      end
    end
  end

  def show
    @order = Shop::Order.find(order_id_param)
    stale? @order do
      respond_with @order
    end
  end

  private

    def order_params
      begin
        puts "\nOC#order_params - params: #{params}\n"
        params.require(:shop_order).permit(:message, :payment)
      rescue ActionController::ParameterMissing
        nil
      end
    end

    def order_address_params
      begin
        params.require(:shop_order).require(:address).permit(:street, :city, :postal_number, :country, :phone_number, :description, :home)
      rescue ActionController::ParameterMissing
        nil
      end
    end

    def user_address_param
      begin

        params.require(:shop_order).require(:address)
      rescue ActionController::ParameterMissing
        nil
      end
    end

    def order_id_param
      begin
        params.require(:id)
      rescue ActionController::ParameterMissing
        nil
      end
    end

    def user_email_param
      begin
        params.require(:user).permit(:email)
      rescue ActionController::ParameterMissing
        nil
      end
    end

end
