class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :flash_to_headers
  rescue_from ActionController::RoutingError, :with => :render_404

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

    def render_404(exception = nil)
      if exception
          logger.info "Rendering 404: #{exception.message}"
      end

      render :file => "#{Rails.root}/public/404", :formats => [:html], :status => 404, :layout => false
    end
end
