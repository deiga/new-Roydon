class Shop::ShopController < ApplicationController
  layout 'shop'
  
  def index
    session[:top_category_ids] = Category.top_categories.map(&:id).map(&:to_s)
    @top_category = Category.find_by id: params[:top_category_id] unless params[:top_category_id].nil?
    @categories = @top_category.children unless @top_category.nil?
    @category = Category.find_by_formatted_name params[:category] unless params[:category].nil?
    @shopping_cart = ShoppingCart.find_or_create_by(id: session[:shopping_cart_id])
    session[:shopping_cart_id] = @shopping_cart.id
  end

  def add_to_cart
  end

end
