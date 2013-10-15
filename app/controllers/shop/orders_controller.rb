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
    cart_items = @cart.items.with_product
    if current_user.nil?
      user = User.create(user_email_param)
      address = Address.create(order_address_params) unless order_address_params.nil?
      user.addresses << address
      # TODO Email login information
    else
      user = current_user
      address = Address.find_or_create(user_address_param) unless user_address_param.nil?
    end
    user.addresses << address unless (user.addresses.include?(address) && address.user.present?)

    @order = Shop::Order.build_from(order_params, cart_items, user, address)

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
