class WelcomeController < ApplicationController
  def index
    redirect_to rsvps_path if current_rsvp
  end
end
