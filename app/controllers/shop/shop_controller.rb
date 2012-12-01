class Shop::ShopController < ApplicationController
  layout 'shop'
  before_filter :set_cart
  before_filter :load_top_menu, except: ['add_to_cart']
  before_filter :load_side_menu, except: ['add_to_cart']

  def index
    @newest_products = Shop::Product.active.desc(:updated_at).includes(:options).includes(:value_added_tax).take(9)
  end

  def add_to_cart
    @shopping_cart.add(params[:product], params[:options])

    success_msg = I18n.t 'shop.cart.add.success'
    respond_to do |format|
      flash[:notice] = success_msg
      format.html { redirect_to(request.referer ||shop_path) }
      format.js { render :json => { message: success_msg } }
    end
  end

  private

    def set_cart
      begin
        @shopping_cart = (session[:shopping_cart_id].nil? && Shop::ShoppingCart.create) || Shop::ShoppingCart.find(session[:shopping_cart_id])
      rescue Mongoid::Errors::DocumentNotFound
        @shopping_cart = Shop::ShoppingCart.create
      end
      session[:shopping_cart_id] = @shopping_cart.id.to_s
    end

    def load_top_menu
      @top_categories = Shop::Category.top_categories
    end

    def load_side_menu
      unless params[:category].nil?
        @category = Shop::Category.active.where(permalink: params[:category])
        @top_category = Shop::Category.active.where(permalink: params[:category].split('~').first).first
        @categories = @top_category.children.active unless @top_category.nil?
      end
    end

end
