class Shop::ProductsController < Shop::ShopController
  
  def index
    @category = Category.where(:permalink => params[:category]).first
    @products = @category.all_products.asc('name').page(params[:page]) unless @category.nil?
  end

  def show
  end

end
