class WelcomeController < ApplicationController
  # skip_before_action :authenticate_user!
  # before_action :authenticate
  def index
    # @events = Event.all
    @events = Event.order(:start_time)
    @users = User.paginate(page: params[:page], per_page: 5)
    # @events = Event.where("start_at < ?", Time.zone.now).order(:start_at)
  end
end
