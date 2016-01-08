class MoveRatingFromPhotosToReviews < ActiveRecord::Migration
  def change
    remove_column :photos, :rating, :string
    add_column :reviews, :rating, :string
  end
end
