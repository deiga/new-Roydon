# encoding: UTF-8
class Shop::ShoppingCartsController < Shop::ShopController
  def show
    begin
      @cart = ShoppingCart.find(params[:id])
    rescue Mongoid::Errors::DocumentNotFound => e
      flash[:error] = "Ostoskoria ei löytynyt"
      not_found
    end
    
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
