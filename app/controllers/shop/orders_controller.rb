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
    @order.address = Address.find(order_address_param) unless order_address_param.nil?
    if current_user.nil?
      @user.user = User.create(user_email_param)
    else
      @order.user = current_user
    end

    respond_to do |format|
      if @order.save
        @cart.destroy
        session[:cart_id] = nil
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

    def order_address_param
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
