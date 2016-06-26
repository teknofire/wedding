class WelcomeController < ApplicationController
  def index
    redirect_to rsvp_path if current_rsvp
  end
end
