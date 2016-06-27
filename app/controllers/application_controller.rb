class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_rsvp=(rsvp)
    session[:registration_code] = rsvp.slug
  end

  def base_url
    root_url
  end
  helper_method :base_url

  def current_rsvp
    Rsvp.friendly.find(session[:registration_code])
  rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_rsvp
end
