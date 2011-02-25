require 'mongo'
class GridfsController < ActionController::Metal  
  def serve
    gridfs_path = env["PATH_INFO"].gsub("/uploads/", "")
    begin      
      puts APP_CONFIG['gridfs_db_name']
      gridfs_file = Mongo::GridFileSystem.new(Mongoid.database).open(gridfs_path, 'r')
      self.response_body = gridfs_file.read
      self.content_type = gridfs_file.content_type
    rescue => e
      self.status = :file_not_found
      Rails.logger.debug { "#{e}" }
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end
end