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
    @order = Shop::Order.new(order_params)
    @order.add(@cart.items)
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

  private

    def order_params
      begin
        params.require(:shop_order).permit(:name, :email, :address, :country, :city, :postal_number, :phone, :message, :payment, :price, :untaxed_price)
      rescue ActionController::ParameterMissing => e
        nil
      end
    end

end
