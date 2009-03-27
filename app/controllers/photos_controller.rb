class PhotosController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos.find(:all, :order => 'created_at desc')
  end

  def new
    @photo = Photo.new
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new(params[:photo])
    @photo.space = @album.space
    if @photo.save
      redirect_to space_album_photos_path(:album_id => @album)
    end
  end

  def show
    @photo = Photo.find(params[:id])
    unless logged_in_user == @photo.space.user
    @photo.update_attributes(:views_count => @photo.views_count + 1)
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to space_album_photo_path(:id => @photo)
    end
  end

  def destroy
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.destroy
    redirect_to space_album_photos_path(:album_id => @album)
  end

  def set_avatar
    @photo = Photo.find(params[:id])
    @space = Space.find(params[:space_id])
    @old_avatar = @space.photos.select(&:avatar?)

    if @photo.update_attributes(:avatar => true)
      @old_avatar.each { |p| p.update_attributes!(:avatar => false) }
      redirect_to space_path(:id => @photo.space)
    end
  end

  def set_primary
    @photo = Photo.find(params[:id])
    @album = Album.find(params[:album_id])
    @old_primary = @album.photos.select(&:primary?)

    if @photo.update_attributes(:primary => true)
      @old_primary.each { |p| p.update_attributes!(:primary => false) }
      redirect_to space_albums_path
    end
  end
end
