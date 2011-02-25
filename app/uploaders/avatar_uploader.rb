# encoding: utf-8
class AvatarUploader < BaseUploader

  def default_url
    "avatar/#{version_name}.jpg"
  end
  
  version :small do
    process :resize_to_fill => [16, 16]
  end
  
  version :normal do
    process :resize_to_fill => [48, 48]
  end
  
  version :large do
    process :resize_to_fill => [80, 80]
  end
  
end
