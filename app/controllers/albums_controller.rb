class AlbumsController < ApplicationController
  def index
    @space = Space.find(params[:space_id])
    @albums = @space.albums.find(:all, :order => ' created_at desc')
  end

  def new
    @album = Album.new
  end

  def create
    @space = Space.find(params[:space_id])
    @album = @space.albums.new(params[:album])

    if @album.save
      flash[:notice] = '相册创建成功!'
      redirect_to space_albums_path
    else
      render :action => "new"
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to space_album_photos_path(:album_id => @album)
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to space_albums_path
  end
end
