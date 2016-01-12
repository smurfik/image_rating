class ReviewsController < ApplicationController

  def index
    photo_ids_reviewed_by_user = Review.where(user_id: current_user.id).pluck(:photo_id)
    photos_for_review = Photo.where.not(id: photo_ids_reviewed_by_user, user_id: current_user.id)
    @photo = photos_for_review.sample
    @review = Review.new
  end

  def create
    @photo = Photo.find(params[:id])
    @review = current_user.reviews.build(params.require(:review).permit(:comment, :rating))
    @review.photo_id = @photo.id
    if @review.save
      ImageMailer.rate(current_user.id, @review.id).deliver_now
      redirect_to review_path, notice: "Thanks for the review!"
    else
      render :index
    end
  end

end
