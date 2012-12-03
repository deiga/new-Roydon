class Shop::OrdersController < Shop::ShopController
  def new
    if @shopping_cart.empty?
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
    order_params = params[:shop_order]
    order_params = order_params.merge("price" => Money.new(order_params["price"]), "tax_amount" => Money.new(order_params["tax_amount"])) unless order_params.nil?
    @order = Shop::Order.new(order_params)
    @order.add(@shopping_cart.items)
    respond_to do |format|
      if @order.save
        @shopping_cart.destroy
        session[:cart_id] = nil
        format.html { redirect_to shop_url, notice: 'Thank you for your order.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: 'Failure' }
      end
    end
  end

end
