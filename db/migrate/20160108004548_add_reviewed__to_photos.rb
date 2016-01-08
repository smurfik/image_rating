class AddReviewedToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :reviewed, :boolean, default: :false
  end
end
