class Shop::ProductsController < Shop::ShopController
  
  def index
    @category = Category.where(:permalink => params[:category]).first
    @products = @category.all_products.order('name').page(params[:page])
  end

  def show
  end

end
