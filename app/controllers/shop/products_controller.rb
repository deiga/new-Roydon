class Shop::ProductsController < Shop::ShopController

  def index
    category_params = params[:category] || ''
    @category = Shop::Category.includes(:products).where(:permalink => category_params.split('~').last).first
    @products = Shop::Product.category_products(@category).page(params[:page]) unless @category.nil?
  end

  def show
    @product = Shop::Product.find(params[:id])
  end
end
