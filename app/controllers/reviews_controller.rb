class ReviewsController < ApplicationController

  def index
    selected_photos =
      Photo.includes(:reviews).where("reviews.user_id is null or reviews.user_id != ?", current_user.id).where.not(user_id: current_user.id).references(:reviews)
    # none_user_photo_ids = photo.where.not(user_id: current_user.id).pluck(:id)
    # photo_ids_reviewed_by_user = review.where(user_id: current_user.id).pluck(:photo_id)
    # selected_photos = photo.where(id: none_user_photo_ids  - photo_ids_reviewed_by_user)
    @photo = selected_photos.sample
  end

  def create
    @photo = Photo.find(params[:id])
    @review = current_user.reviews.build(params.require(:review).permit(:comment, :rating))
    @review.photo_id = @photo.id
    if @review.save
      redirect_to review_path, notice: "Thanks for the review!"
    else
      flash[:notice] = "Don't forget to rate the photo"
      render :index
    end
  end

  def ranked
  end

end
