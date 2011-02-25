# encoding: utf-8
class PhotoUploader < BaseUploader
  
  def default_url
    "photo/#{version_name}.jpg"
  end
  
  version :small do
    process :resize_to_limit => [100, nil]
  end
  
  version :normal do
    process :resize_to_limit => [680, nil]
  end

end
