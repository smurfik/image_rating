class PhotosController < ApplicationController

  def main
  end

  def index
    @photos = current_user.photos
  end

  def new
  end

  def review
    @photos = Photo.all
    @selected_photos = []
    @photos.each do |photo|
      # photo.comments.each do |comment|
      #   next if comment.user_id == current_user.id
      # end
      if photo.user_id != current_user.id
        @selected_photos << photo
      end
    end
    @selected_photo = @selected_photos.sample
  end

  def review_photo
    @photo = Photo.find(params[:id])
    if params[:comment][:body] != ""
      @comment = current_user.comments.build(params.require(:comment).permit(:body))
      @comment.photo_id = @photo.id
      # @comment.save
    end
    if params[:comment][:rating] == "thumbs up"
      @photo.thumbs_up += 1
    elsif params[:comment][:rating] == "thumbs down"
      @photo.thumbs_down += 1
    elsif params[:comment][:rating] == "meh"
      @photo.meh += 1
    end
    raise
    # @photo.save
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
    @photo.delete
    redirect_to photos_path, notice: "The photo was deleted!"
  end

end
