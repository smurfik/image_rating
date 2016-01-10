class ReviewsController < ApplicationController

  def index
    selected_photos = Photo.includes(:reviews).where("reviews.user_id IS NULL OR reviews.user_id != ?", current_user.id).where.not(user_id: current_user.id).references(:reviews)
    # photo_ids_of_user = Photo.where.not(user_id: current_user.id).pluck(:id)
    # photo_ids_reviewed_by_user = Review.where(user_id: current_user.id).pluck(:photo_id)
    # selected_photos = Photo.where.not(id: photo_ids_of_user + photo_ids_reviewed_by_user)
    @random_photo = selected_photos.sample
  end

  def create
    @photo = Photo.find(params[:id])
    @review = current_user.reviews.build(params.require(:review).permit(:comment, :rating))
    @review.photo_id = @photo.id
    @review.save
    redirect_to photos_path, notice: "Thanks for the review!"
  end

  def ranked
  end

end
