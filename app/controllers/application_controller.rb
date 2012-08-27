class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :flash_to_headers

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
end
