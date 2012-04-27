class Shop::ShopController < ApplicationController
  
  def index
    @top_categories = Category.top_categories
    @top_category = Category.find_by_formatted_name params[:top_category] unless params[:top_category].nil?
    @categories = @top_category.children unless @top_category.nil?
    @category = Category.find_by_formatted_name params[:category] unless params[:category].nil?
    @shopping_cart = session[:shopping_cart] ||= ShoppingCart.new
    
    unless @category.nil?
      @products = @category.products.page(params[:page])
    else
      @products = @top_category.products.page(params[:page]) unless @top_category.nil?
    end
  end

end
