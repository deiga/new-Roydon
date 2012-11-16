class Shop::ProductsController < Shop::ShopController

  def index
    @category = Shop::Category.where(:permalink => params[:category]).first
    @products = @category.all_products.asc('name').includes(:options).page(params[:page]) unless @category.nil?
  end

  def show
    @product = Shop::Product.where(id: params[:id]).first
    if @product.nil?
      not_found
    end
  end

end
