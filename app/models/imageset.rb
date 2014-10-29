class Imageset < ActiveRecord::Base


	has_attached_file :averaged_image, styles: { standard: '640x640>', small: '300x300>' }, :default_url => "/assets/spinner.gif"
	validates_attachment_content_type :averaged_image, :content_type => /\Aimage\/.*\Z/
	

  def save_averaged_image(session)
    @instagram = Instagram.user_recent_media(:access_token => session[:access_token])
  	@recent_media = ImageList.new
	  @instagram.each do |instagram| 
	    @recent_media.read(instagram.images.standard_resolution.url)
	  end
  	averaged = @recent_media.average
  	contrastified = averaged.contrast_stretch_channel('3%')
    file = Tempfile.new('averaged_temp')
  	contrastified.write(file.path)
  	self.averaged_image = File.open file.path
  	self.save!
   end
end



