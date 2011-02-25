# coding: UTF-8
require 'mongo'
include Mongo
namespace :gridfs do
  task :import => :environment do      
    @grid = GridFsImporter.new
    
    puts "-"*120
    puts "Import Photos"
    photos_styles = %w(small normal original)
    Photo.all.each do |photo|
      photos_styles.each do |style|
        @grid.put(photo, 'image', style)
      end
    end

    puts "-"*120
    puts "Import Users"
    avatars_styles = %w(small normal large original)
    User.all.each do |user|
      avatars_styles.each do |style|
        @grid.put(user, 'avatar', style)
      end
    end
    
    # id = @grid.put(File.open(file_path), file_name)
  end
end

class GridFsImporter
  def initialize
    @grid = Grid.new(Mongoid.database)
  end
  
  def put(model, attr_name, style)    
    hashed_path = BaseUploader.new.hashed_path(model.id)
    file_name = "#{model.class.to_s.tableize}/#{attr_name.tableize}/#{hashed_path}/#{model.id}_#{style}.jpg"
    real_file_name = File.join([APP_CONFIG['upload_root'],file_name])
    
    begin
      f = File.open(real_file_name)
    rescue => e
      puts "** [Error] open file error: #{e}"
    end
    
    
    if old = @grid.exist?({'filename' => file_name})
      puts "-- skip, old #{old['filename']} existed."
    else
      begin
        id = @grid.put(File.open(real_file_name), :filename => file_name)      
        puts "#{file_name} saved."
      rescue => e
        puts "** [GridFS] save file error: #{e}"
      end
    end
    
  end
end
