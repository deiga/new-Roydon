class Shop::ShopController < ApplicationController
  layout 'shop'
  
  def index
    @top_categories = Category.top_categories
    @top_category = Category.find_by_formatted_name params[:top_category] unless params[:top_category].nil?
    @categories = @top_category.children unless @top_category.nil?
    @category = Category.find_by_formatted_name params[:category] unless params[:category].nil?
    @shopping_cart = session[:shopping_cart] ||= ShoppingCart.new
  end

end
