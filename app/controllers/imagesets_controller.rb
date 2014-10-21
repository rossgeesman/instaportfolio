class ImagesetsController < ApplicationController
	
  def show
  	@imageset = Imageset.find(params[:id])
  end
  
  def index
    @imagesets = Imageset.all
  end

  def new
    @instagram = Instagram.user_recent_media
  end
 
  def create
  	@imageset = Imageset.new
    @imageset.save
    Delayed::Job.enqueue ImagesetJob.new(:access_token => session[:access_token], :id => @imageset.id)
      if @imageset.save
        redirect_to @imageset
      else
        redirect_to root_url
      end
  end

  def processing
    @imageset = Imageset.find(params[:id])
    if @imageset.averaged_image_file_size.nil?
      render :json => 1
    else
      render :json => 0
    end
  end

  def processed_image
    @imageset = Imageset.find(params[:id])
    render :json => @imageset.averaged_image.url(:standard)
  end

  def imageset_params
    params.require(:imageset).permit(:averaged_image, :imageset)
  end
end
