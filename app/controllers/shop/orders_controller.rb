class Shop::OrdersController < Shop::ShopController

  respond_to :html, :js

  def new
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
    @order.user = current_user
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
  end

  private

    def order_params
      begin
        params.require(:shop_order).permit(:name, :email, :address, :country, :city, :postal_number, :phone, :message, :payment, :price, :untaxed_price)
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

end
