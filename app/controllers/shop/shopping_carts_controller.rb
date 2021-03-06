# encoding: UTF-8
class Shop::ShoppingCartsController < Shop::ShopController
  before_filter :set_cart, except: [:remove_item, :add_item]
  before_filter :set_modify_cart, only: [:remove_item, :add_item]

  def show
    begin
      @cart_items = @cart.items.with_product
    rescue Mongoid::Errors::DocumentNotFound
      flash[:error] = t 'shop.cart.errors.not_found'
    end
  end

  def edit
    begin
      @cart_items = @cart.items.with_product
    rescue Mongoid::Errors::DocumentNotFound
      flash[:error] = t 'shop.cart.errors.not_found'
    end
  end

  def update
    if @cart.update_attributes(cart_params)
      flash[:notice] = t 'shop.cart.update.success'
    else
      flash[:error] = t 'shop.cart.update.failure'
    end
    redirect_to([:edit, @cart]) and return #edit_shop_shopping_cart_path(@cart.id)
  end

  def remove_item
    size_before = @cart.size
    @cart.remove_item(params[:id])
    if size_before > @cart.size
      msg = I18n.t 'shop.cart.remove.success'
      flash[:notice] = msg
    else
      msg = I18n.t 'shop.cart.remove.failure'
      flash[:alert] = msg
    end
    item_response(msg)
  end

  def add_item
    size_before = @cart.size
    @cart.add(params[:id], params[:options])
    if size_before < @cart.size
      msg = I18n.t 'shop.cart.add.success'
      flash[:notice] = msg
    else
      msg = I18n.t 'shop.cart.add.failure'
      flash[:alert] = msg
    end
    item_response(msg)
  end

  def destroy
    @cart.destroy
    redirect_to(shop_path) and return
  end

  private

    def item_response(message)
      respond_to do |format|
        format.html { redirect_to(request.referer || shop_path) and return }
        format.js { render json: { message: message } }
      end
    end

    def cart_params
      params.require(:shop_shopping_cart).permit(items_attributes: [:quantity, :id])
    end

    def set_cart
      @cart = Shop::ShoppingCart.find(params[:id])
    end

    def set_modify_cart
      @cart = Shop::ShoppingCart.find(params[:shopping_cart_id])
    end

end
