class EventsController < ApplicationController
  def index
    @events = Event.approved
  end
  
  def show
  	@event = Event.find(params[:id])
  	unless @event.is_approved == false
      flash[:error] = "Sorry, that video hasn't been approved yet"    
      redirect_to :action=>'index'
  	end
  end
  
  def new
  	@event = Event.new
  end
  
  def create
  	@event = Event.new(params[:event])
    if @event.save
      flash[:notice] = "Event was submitted to be approved"
      redirect_to :action=>'index'
    else
      flash[:error] = @event.errors.full_messages    
      render(:action=>'new')
    end  	
  end
end
