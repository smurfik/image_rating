class RemoveReviewedFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :reviewed, :integer
  end
end
