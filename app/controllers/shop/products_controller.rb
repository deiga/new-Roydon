class Shop::ProductsController < Shop::ShopController

  def index
    category_params = params[:category] || ''
    @category = Shop::Category.where(:permalink => category_params.split('~').first).first
    @products = @category.all_products.asc('name').includes(:options).page(params[:page]) unless @category.nil?
  end

  def show
    @product = Shop::Product.where(id: params[:id]).first
    if @product.nil?
      not_found
    end
  end

end
