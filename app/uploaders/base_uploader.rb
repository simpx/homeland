# coding: UTF-8
require 'carrierwave/processing/mini_magick'
require "digest"
class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::Compatibility::Paperclip
  storage :grid_fs
  
  def paperclip_path
    ":class/:attachment/#{hashed_path(model.id)}/:id_:style.jpg"
  end
    
  
  # Allow image file extensions
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 向下兼容老的从 Paperclip 转移过来的图片存储方式
  def hashed_path(id)
    hash = Digest::MD5.hexdigest(id.to_s)
    hash_path = ''
    3.times { hash_path += '/' + hash.slice!(0..2) }
    hash_path[1..12]
  end  

end