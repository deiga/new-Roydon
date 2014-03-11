module Mall
  class ProductsController < Mall::ShopController

    def index
      category_params = params[:category] || ''
      @category = Category.includes(:products).where(permalink: category_params.split('~').last).first
      @products = Product.category_products(@category).page(params[:page]) unless @category.nil?
    end

    def show
      @product = Product.find(params[:id])
    end
  end
end
