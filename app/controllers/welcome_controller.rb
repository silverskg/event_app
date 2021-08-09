class WelcomeController < ApplicationController
  # skip_before_action :authenticate_user!
  # before_action :authenticate
  def index
    # @events = Event.all
    @events = Event.order(:start_time)
    # @events = Event.where("start_at < ?", Time.zone.now).order(:start_at)
  end
end
