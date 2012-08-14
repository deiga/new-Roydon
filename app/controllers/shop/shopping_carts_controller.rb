class Shop::ShoppingCartsController < Shop::ShopController
  def show
    @cart = ShoppingCart.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end

  def new
  end

end
