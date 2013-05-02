class EventsController < ApplicationController
  def index
    @events = Event.approved
  end
  
  def show
  	@event = Event.find(params[:id])
  	unless @event.is_approved.present?
      flash[:error] = "Sorry, that event hasn't been approved yet"    
      redirect_to :index
  	end
  end
  
  def new
  	@event = Event.new
  end
  
  def create
  	@event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Event was submitted to be approved"
      redirect_to :index
    else    
      render :new
    end  	
  end
end
