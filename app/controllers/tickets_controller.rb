class TicketsController < ApplicationController
  before_action :set_variables

  def new
    raise ActionController::RoutingError, "ログイン状態で TicketsController#new にアクセス"
  end

  def create
    event = Event.find(params[:event_id])
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    if @ticket.save
      redirect_to event, notice: "このイベントに参加表明しました"
    end
  end

  def destroy
    @ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    @ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: "このイベントの参加をキャンセルしました"
  end


  def ticket
    ticket = current_user.events.new(event_id: @event.id)
    ticket.save 
  end

  def unticket
    ticket = current_user.events.find_by(event_id: @event.id)
    ticket.destroy
  end

  private
  def set_variables
    @event = Event.find(params[:event_id])
    @id_name = "#ticket-link-#{@event.id}"
  end
end
