class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :flash_to_headers
  after_filter :store_location

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception do |ex|
      redirect_to '/500', ex: ex, status: 500
    end
    rescue_from ActionController::UnknownController do |ex|
      redirect_to '/404', ex: ex, status: 404
    end
    rescue_from AbstractController::ActionNotFound do |ex| # To prevent Rails 3.2.8 deprecation warnings
      redirect_to '/404', ex: ex, status: 404
    end
    rescue_from ActionController::ParameterMissing do |ex|
      redirect_to '/400', ex: ex.message, status: 404
    end
  end

  rescue_from Mongoid::Errors::DocumentNotFound do |ex|
    # raise ActionController::RoutingError.new('Not Found')
    redirect_to '/404', ex: ex, status: 404
  end

  # def not_found
  #   raise ActionController::RoutingError.new('Not Found')
  # end

  def set_flash(type, object: nil)
    flash[:from] = controller_path
    flash[:action] = action_name
    flash[:type] = type
    flash[:object_type] =  object.nil? ? nil : object.class.name
    flash[:object_id] = object.nil? ? nil : object.id
  end

  private

    def flash_to_headers
      return unless request.xhr?
      response.headers['X-Message-Type'] = flash.keys.first.to_s
      response.headers['X-Message'] = flash[:notice] unless flash[:notice].blank?
      response.headers['X-Message'] = flash[:error] unless flash[:error].blank?

      flash.discard  # don't want the flash to appear when you reload page
    end

    def store_location
      # store last url as long as it isn't a /users path
      session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
    end

    def after_sign_in_path_for(resource)
      session[:previous_url] || shop_path
    end

    def after_update_path_for(resource)
      session[:previous_url] || shop_path
    end

    def after_sign_out_path_for(resource)
      shop_path
    end
end
