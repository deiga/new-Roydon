class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :flash_to_headers
  after_filter :store_location

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from AbstractController::ActionNotFound, with: :render_404 # To prevent Rails 3.2.8 deprecation warnings
    rescue_from ActionController::ParameterMissing do |ex|
      render_exception(400, ex.message, ex)
    end
  end

  rescue_from Mongoid::Errors::DocumentNotFound do |ex|
    render_exception(404, "#{ex.message.match(/class\s(\b.*?)\s/)[0].split('::').last} not found", ex)
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

    def flash_to_headers
      return unless request.xhr?
      response.headers['X-Message-Type'] = flash.keys.first.to_s
      response.headers['X-Message'] = flash[:notice] unless flash[:notice].blank?
      response.headers['X-Message'] = flash[:error] unless flash[:error].blank?

      flash.discard  # don't want the flash to appear when you reload page
    end

    def render_500(exception = nil)
      render_exception(500, exception.message, exception)
    end


    def render_404(exception = nil)
      render_exception(404, 'Page not found', exception)
    end

    def render_exception(status = 500, message = 'Server error', exception)
      @status = status
      @message = message

      if exception
        Rails.logger.fatal "\n#{exception.class.to_s} (#{exception.message})"
        Rails.logger.fatal exception.backtrace.join("\n")
      else
        Rails.logger.fatal "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
      end

      render template: "errors/error", formats: [:html], layout: 'application', status: @status
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
