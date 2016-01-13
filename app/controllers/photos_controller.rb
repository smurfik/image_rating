class PhotosController < ApplicationController

  def main
    if current_user
      redirect_to photos_path
    end
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

  def ranked
    @photos =
      Photo
        .joins("LEFT OUTER JOIN reviews ON photos.id = reviews.photo_id")
        .select("photos.id, photos.user_id, description, image_file, coalesce(sum(reviews.rating), 0) as sum")
        .group("photos.id")
        .order("sum DESC")
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: "The photo was deleted!"
  end

  def other_user
    @user = User.find(params[:user_id])
    @photos = @user.photos
    if @user.id == current_user.id
      redirect_to photos_path
    end
  end

end
