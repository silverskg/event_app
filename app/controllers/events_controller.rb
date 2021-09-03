class EventsController < ApplicationController
  require 'line/bot'  # gem 'line-bot-api'

  # before_action :authenticate_user!
  skip_before_action :authenticate, only: :show, raise: false
  # before_action :authenticate_user!, except: :show


  def show
    @event = Event.find(params[:id])
    @ticket = current_user && current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    d = @event.date.to_date
    s = @event.start_time
    e = @event.end_time
    @event.date = Time.zone.local(d.year, d.month, d.day)
    @event.start_time = Time.zone.local(d.year, d.month, d.day, s.hour, s.min)
    @event.end_time = Time.zone.local(d.year, d.month, d.day, e.hour, e.min)
    if @event.save
      @event.send_message
      redirect_to @event, notice: "作成しました"
    else
      flash.now[:alert] = "未入力欄があります"
      render :new
    end
  end

  def edit
    @event = current_user.created_events.find(params[:id])
    
    # @event = Event.find(params[:id])params[:calendar][:date].to_date
    
    # @event = current_user.created_events.find(params[:id])
  end

  def update
    # @event = Event.find(params[:id])
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      # binding.pry
      redirect_to @event, notice: "更新しました"
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to root_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_time, :end_time, :date
    )
  end

  def authenticate
    super 
  end

end
