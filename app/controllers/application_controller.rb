class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_album

  %w[
    ActiveRecord::RecordNotFound
    AbstractController::ActionNotFound
    ActionController::RoutingError
  ].each do |exception|
    rescue_from exception, with: :render_404
  end

  def render_404
    render 'application/404', status: 404
  end

  def current_album
    Album.find(params[:album_id])
  end
end
