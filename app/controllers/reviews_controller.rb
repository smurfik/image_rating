class ReviewsController < ApplicationController

  def index
    # Get all of the pictures that a person has not reviewed
    # Photo table -> get pictures a person has not reviewed
    # select * From photo where user_id is not in Re
    # Photo -> Review -> user_id
    # Photo has many Reviews
    # Get all reviews for a photo
    # photo_ids_that_have_been_reviewed = 'select photo_id From Review where user_id = 1234'
    # photos_user_has_not_reviewed = 'select * from photo where photo.id NOT IN (select photo_id From Review where user_id = 1234)'
    # SELECT * FROM photos WHERE photos.id NOT IN (SELECT photo_id FROM reviews WHERE user_id = 2) AND photos.user_id != 2;
    # Get photos user has not created as well
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
      ImageMailer.rate(current_user.id, @review.id).deliver_now if current_user.notification
      redirect_to review_path, notice: "Thanks for the review!"
    else
      render :index
    end
  end

end
