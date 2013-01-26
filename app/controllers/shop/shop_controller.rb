class Shop::ShopController < ApplicationController
  layout 'shop'
  before_filter :set_cart
  before_filter :load_top_menu
  before_filter :load_side_menu
  before_filter :set_title

  def index
    @newest_products = Shop::Product.active.desc(:updated_at).includes(:options).limit(9)
  end

  def search
    @products = Shop::Product.search(params[:search]).page(params[:page])
  end

  private

    def set_cart
      begin
        @cart = (session[:shopping_cart_id].nil? && Shop::ShoppingCart.create) || Shop::ShoppingCart.find(session[:shopping_cart_id])
      rescue Mongoid::Errors::DocumentNotFound
        @cart = Shop::ShoppingCart.create
      end
      session[:shopping_cart_id] = @cart.id.to_s
    end

    def set_title
      @title = ''
      unless @top_category.nil?
        @title = "#{@top_category.name.capitalize} | "
      end
      @title += t 'shop.shop'

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
