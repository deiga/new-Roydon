module Mall
  class BaseController < ::ApplicationController
    layout 'shop'
    protect_from_forgery with: :exception
    before_action :set_cart
    before_action :load_top_menu
    before_action :load_side_menu
    before_action :set_title

    private

    def set_cart
      begin
        @cart = (session[:shopping_cart_id].nil? && Mall::ShoppingCart.create!) || Mall::ShoppingCart.find(session[:shopping_cart_id])
      rescue Mongoid::Errors::DocumentNotFound
        @cart = Mall::ShoppingCart.create!
      end
      session[:shopping_cart_id] = @cart.id.to_s
    end

    def set_title
      if params[:search]
        @title = "#{t('shop.search.action')}`#{params[:search]}`"
      else
        @title = @top_category.present? ? "#{@top_category.name.capitalize}" : ''
      end
      @title += params[:page] ? " #{t('shop.search.page')} #{params[:page]}" : ''
      @title += "#{@title.present? ? ' | ' : ''}#{t 'shop.shop'}"
    end

    def load_top_menu
      @top_categories = Mall::Category.top_categories
    end

    def load_side_menu
      unless params[:category].nil?
        @category = Mall::Category.active.where(permalink: params[:category])
        @top_category = Mall::Category.active.where(permalink: params[:category].split('~').first).first
        @categories = @top_category.children.active unless @top_category.nil?
      end
    end
  end
end
