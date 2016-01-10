class AddReviewsCountToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :reviews_count, :integer, default: 0
  end
end
