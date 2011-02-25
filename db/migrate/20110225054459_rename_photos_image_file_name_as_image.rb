class RenamePhotosImageFileNameAsImage < ActiveRecord::Migration
  def self.up
    rename_column :photos, :image_file_name, :image
    rename_column :users, :avatar_file_name, :avatar
  end

  def self.down
    rename_column :photos, :image, :image_file_name
    rename_column :users, :avatar, :avatar_file_name
  end
end
