class EventsController < ApplicationController
  def new
  end

  def create
    @event = @current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event is successfully created !"
      redirect_to @event
    else
      flash.now[:danger] = "Description or date field is empty."
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @relationships = @event.relationships
  end

  def index
    @events = Event.all
  end

  private

    def event_params
      params.require(:event).permit(:description, :date)
    end
end
