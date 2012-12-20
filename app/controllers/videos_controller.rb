class VideosController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:create, :edit, :update, :destroy, :new, :vote_up, :vote_down]

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
  end

  def new
  	@video = Video.new
  end
  
  def vote_up
  	@video = Video.find(params[:id])  
  	current_user.vote_for(@video)
    flash[:notice] = "Vote added"
    redirect_to video_path(@video)  	
  end
  
  def vote_down
  	@video = Video.find(params[:id])   
  	current_user.unvote_for(@video)  
    flash[:notice] = "Vote removed"
    redirect_to video_path(@video)
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
 	@voted_for = false
 	
  	if current_user
		if current_user.voted_for?(@video)
			@voted_for = true
		end
  	end
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
