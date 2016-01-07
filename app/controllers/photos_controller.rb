class PhotosController < ApplicationController

  def main
  end

  def index
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

end
