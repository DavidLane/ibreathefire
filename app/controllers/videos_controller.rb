class VideosController < ApplicationController

  def index
    @featured_videos = Video.featured
  	@videos = Video.newest
  end
  
  def timeline
    @videos = Video.timeline
    
    respond_to do |format|
      format.html
      format.json
    end    
  end

  def new
  	@video = Video.new
  end

  def create
  	@video = Video.new(params[:video])
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
  
end
