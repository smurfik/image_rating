class ReviewsController < ApplicationController

  def index
  end

  def create
  end

  # def review
  #   @photos = Photo.all
  #   @selected_photos = []
  #   @photos.each do |photo|
  #     # photo.reviews.each do |review|
  #     #   next if review.user_id == current_user.id
  #     # end
  #     if photo.user_id != current_user.id
  #       @selected_photos << photo
  #     end
  #   end
  #   @selected_photo = @selected_photos.sample
  #   Photo.includes(:reviews).where.not(reviews: {user_id: current_user.id}).references(:reviews)
  # end

  # def review_photo
  #   raise
  #   @photo = Photo.find(params[:id])
  #   if params[:review][:comment] != ""
  #     @comment = current_user.comments.build(params.require(:review).permit(:comment, :rating))
  #     @comment.photo_id = @photo.id
  #     @comment.save
  #   end
  #   redirect_to photos_path, notice: "Thanks for the review!"
  # end
end
