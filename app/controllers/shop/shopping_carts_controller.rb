# encoding: UTF-8
class Shop::ShoppingCartsController < Shop::ShopController
  def show
    begin
      @cart = Shop::ShoppingCart.find(params[:id])
    rescue Mongoid::Errors::DocumentNotFound
      flash[:error] = t 'shop.cart.errors.not_found'
      not_found
    end
  end

  def edit
    begin
      @cart = Shop::ShoppingCart.find(params[:id])
      @cart_items = @cart.items.includes(:product)
    rescue Mongoid::Errors::DocumentNotFound
      flash[:error] = t 'shop.cart.errors.not_found'
      not_found
    end
  end

  def update
    @cart = Shop::ShoppingCart.find(params[:id])
    if @cart.update_attributes(cart_params)
      flash[:notice] = t 'shop.cart.update.success'
    else
      flash[:error] = t 'shop.cart.update.failure'
    end
    redirect_to edit_shop_shopping_cart_path(@cart)
  end

  def destroy
  end

  def create
  end

  def new
  end

  private

    def cart_params
      params.require(:shop_shopping_cart).permit(items: [:quantity])
    end

end
