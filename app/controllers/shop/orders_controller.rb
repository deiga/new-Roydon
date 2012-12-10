class Shop::OrdersController < Shop::ShopController
  def new
    if @cart.empty?
      redirect_to shop_url, notice: 'Your cart is empty'
      return
    end

    @order = Shop::Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def create
    # FIXME: https://github.com/RubyMoney/money-rails/issues/60
    order_parameters = order_params
    order_parameters = order_parameters.merge("price" => Money.new(order_parameters["price"]), "untaxed_price" => Money.new(order_parameters["untaxed_price"])) unless order_parameters.nil?
    @order = Shop::Order.new(order_parameters)
    @order.add(@cart.items)
    respond_to do |format|
      if @order.save
        @cart.destroy
        session[:cart_id] = nil
        format.html { redirect_to shop_url, notice: 'Thank you for your order.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: 'Failure' }
      end
    end
  end

  private

    def order_params
      begin
        params.require(:shop_order).permit(:name, :email, :address, :country, :city, :postal_number, :phone, :message, :payment, :price, :untaxed_price)
      rescue ActionController::ParameterMissing => e
        nil
      end
    end

end
