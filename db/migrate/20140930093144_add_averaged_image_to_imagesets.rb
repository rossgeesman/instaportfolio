class AddAveragedImageToImagesets < ActiveRecord::Migration
  def self.up
    add_attachment :imagesets, :averaged_image
  end

  def self.down
    remove_attachment :imagesets, :averaged_image
  end
end
