class ReportsController < ApplicationController
  def index
    @rsvps = Rsvp.all
  end
end
