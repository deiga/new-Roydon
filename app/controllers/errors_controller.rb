# http://blog.plataformatec.com.br/2012/01/my-five-favorite-hidden-features-in-rails-3-2/

class ErrorsController < ApplicationController
  def not_found
    if params[:ex]
      render_404("#{params[:ex].message.match(/class\s(\b.*?)\s/)[0].split('::').last} not found", params[:ex])
    else
      render_404
    end
  end

  def server_error
    render_500(params[:ex])
  end

  def no_route
    render_404("Route does not exist #{params[:a]}")
  end

  def error
    @exception = params[:ex] || env["action_dispatch.exception"]
    @status = params[:status]
    @message = exception.try(:message) || "Undefined error"
  end

  private

    def render_exception(status = 500, message = 'Server error', exception)
      @status = status
      @message = message

      if exception
        logger.fatal "\n#{exception.class.to_s} (#{exception.message})"
        logger.fatal exception.backtrace.join("\n")
      else
        logger.fatal "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
      end

      render :error #, formats: [:html], layout: 'application', status: @status
    end

    def render_500(exception = nil)
      render_exception(500, exception.try(:message), exception)
    end

    def render_404(message = 'Page not found', exception = nil)
      render_exception(404, message, exception)
    end
end
