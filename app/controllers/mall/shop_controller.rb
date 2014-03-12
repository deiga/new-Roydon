module Mall
  class ShopController < Mall::ApplicationController
    def index
      @newest_products = Product.active.desc(:updated_at).includes(:options).limit(9)
    end

    def search
      @products = Product.search(params[:search]).page(params[:page])
    end
  end
end
