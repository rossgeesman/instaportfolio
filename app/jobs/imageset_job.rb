ImagesetJob = Struct.new(:access_token, :id) do
  
  def perform
    @instagram = Instagram.user_recent_media(access_token)
  	@recent_media = ImageList.new
	  @instagram.each do |instagram| 
	    @recent_media.read(instagram.images.standard_resolution.url)
	  end

  	averaged = @recent_media.average
  	contrastified = averaged.contrast_stretch_channel('3%')
    file = Tempfile.new('averaged_temp')
  	contrastified.write(file.path)
    @imageset = Imageset.find(access_token[:id])
  	@imageset.averaged_image = File.open file.path
  	@imageset.save!
  end

  def after(job)
    
  end
end

