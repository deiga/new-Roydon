# encoding: UTF-8
class Shop::ShoppingCartsController < Shop::ShopController
  before_filter :set_cart, except: [:remove_item, :add_item]
  before_filter :set_modify_cart, only: [:remove_item, :add_item]

  def show
    begin
    rescue Mongoid::Errors::DocumentNotFound
      flash[:error] = t 'shop.cart.errors.not_found'
      not_found
    end
  end

  def edit
    begin
      @cart_items = @cart.items.includes(:product)
    rescue Mongoid::Errors::DocumentNotFound
      flash[:error] = t 'shop.cart.errors.not_found'
      not_found
    end
  end

  def update
    if @cart.update_attributes(cart_params)
      flash[:notice] = t 'shop.cart.update.success'
    else
      flash[:error] = t 'shop.cart.update.failure'
    end
    redirect_to edit_shop_shopping_cart_path(@cart)
  end

  def remove_item
    @cart.remove(params[:id])
    success_msg = I18n.t 'shop.cart.remove.success'
    respond_to do |format|
      flash[:notice] = success_msg
      format.html { redirect_to(request.referer ||shop_path) }
      format.js { render :json => { message: success_msg } }
    end
  end

  def add_item
    @cart.add(params[:id], params[:options])
    success_msg = I18n.t 'shop.cart.add.success'
    respond_to do |format|
      flash[:notice] = success_msg
      format.html { redirect_to(request.referer ||shop_path) }
      format.js { render :json => { message: success_msg } }
    end
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

    def set_cart
      @cart = Shop::ShoppingCart.find(params[:id])
    end

    def set_modify_cart
      @cart = Shop::ShoppingCart.find(params[:shopping_cart_id])
    end

end
