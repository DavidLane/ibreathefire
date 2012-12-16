class VideosController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:create, :edit, :update, :destroy, :new]

  def index
    @featured_videos = Video.featured
  	@videos = Video.newest
  end
  
  def top_rated
    @videos = Video.top_rated
    render "index"
  end
  
  def timeline
    @videos = Video.timeline
    render "index"    
  end

  def new
  	@video = Video.new
  end

  def create
  	@video = Video.new(params[:video])
  	@video.user_id = current_user.id
  	@video.slug = @video.title.parameterize
  	
    if @video.save
      flash[:notice] = "Video was created"
      redirect_to video_path(@video)
    else
      flash[:error] = @video.errors.full_messages    
      render(:action=>'new')
    end
  end

  def show
  	@video = Video.find(params[:id])
  end

  def edit
  	@video = Video.find(params[:id])
  end

  def update
  	@video = Video.find(params[:id])

    if @video.user_id == current_user.id
      if @video.update_attributes(params[:video])
	    flash[:notice] = "Video was edited"      
        redirect_to(:action=>'index')
      else
        flash[:error] = @video.errors.full_messages          
        render(:action=>'edit')
      end
    end  
  end

  def destroy
  	@video = Video.find(params[:id])
  	
    if @video.user_id == current_user.id
    	if @video.destroy
          flash[:notice] = "Video was deleted"    	
	      redirect_to(:action=>'index')    	
	    else
          flash[:error] = @video.errors.full_messages    	    
          render(:action=>'edit')
    	end
    end
  end
  
end
