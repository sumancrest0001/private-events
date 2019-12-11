# frozen_string_literal: true

class EventsController < ApplicationController
  def new; end

  def create
    current_user
    @event = @current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event is successfully created !'
      redirect_to @event
    else
      flash.now[:danger] = 'Description or date field is empty.'
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @relationships = @event.relationships
  end

  def index
    @past_events = Event.past
    @future_events = Event.upcoming
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
