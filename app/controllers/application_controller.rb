class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: :render_404

  if !Rails.env.development?
    rescue_from ActionView::MissingTemplate, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from Exception, with: :render_500
  end

  def render_404
    respond_to do |format|
      format.html { render 'errors/404', status: 404 }
      format.all { head :not_found }
    end
  end

  def render_500(e = nil)
    logger.error e
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    respond_to do |format|
      format.html { render 'errors/404', status: 404 }
      format.all { head :not_found }
    end
  end
end
