# encoding: UTF-8
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
    # raise session.inspect
    shopping_cart = ShoppingCart.find_or_create_by(id: session[:shopping_cart_id])
    session[:shopping_cart_id] = shopping_cart.id
    product = Product.find(params[:product])
    shopping_cart.add(product)

    respond_to do |format|
        format.html { flash[:notice] = 'Tuote lisätty onnistuneesti'; redirect_to(request.referer ||shop_path) }
        format.json  {render :json => { message: 'Tuote lisätty onnistuneesti' } }
      end
  end

end
