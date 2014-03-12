module Mall
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_cart
    before_action :load_top_menu
    before_action :load_side_menu
    before_action :set_title

    private

    def set_cart
      begin
        @cart = (session[:shopping_cart_id].nil? && ShoppingCart.create!) || ShoppingCart.find(session[:shopping_cart_id])
      rescue Mongoid::Errors::DocumentNotFound
        @cart = ShoppingCart.create!
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
      @top_categories = Category.top_categories
    end

    def load_side_menu
      unless params[:category].nil?
        @category = Category.active.where(permalink: params[:category])
        @top_category = Category.active.where(permalink: params[:category].split('~').first).first
        @categories = @top_category.children.active unless @top_category.nil?
      end
    end
  end
end
