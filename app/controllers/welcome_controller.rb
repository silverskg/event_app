class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def home
    @events = Event.order(:start_time)
    @users = User.paginate(page: params[:page], per_page: 5)
    @rooms = Room.all.order(:id)
  end
end
