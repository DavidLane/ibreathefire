class EventsController < ApplicationController
  def index
    @events = Event.find(:all)
  end
  
  def show
  	@event = Event.find(params[:id])
  end
  
  def new
  end
end
