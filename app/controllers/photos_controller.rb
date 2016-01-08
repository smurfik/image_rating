class PhotosController < ApplicationController

  def main
  end

  def index
    @photos = current_user.photos
  end

  def new
  end

  def create
    @photo = current_user.photos.build(params.require(:photo).permit(:description, :image_file))
    if @photo.save
      redirect_to photos_path, notice: "The photo was successfully added!"
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: "The photo was deleted!"
  end

end
