class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @albums = current_user.albums.order('id DESC').page(params[:page] || 1)
  end

  def show
    @photos = @album.photos.order('id DESC').page(params[:page] || 1)
  end

  def new
    @album = current_user.albums.new
  end

  def edit; end

  def create
    @album = current_user.albums.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:id, :name, photos_attributes: %i[id image description])
  end
end
