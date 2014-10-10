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

      if @imageset.save
        @imageset.delay.save_averaged_image(session)
        redirect_to @imageset
      else
        redirect_to root_url
      end
  end
  


  def imageset_params
    params.require(:imageset).permit(:averaged_image, :imageset)
  end
end
