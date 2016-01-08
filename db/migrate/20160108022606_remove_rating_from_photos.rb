class RemoveRatingFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :thumbs_down, :integer
    remove_column :photos, :thumbs_up, :integer
    remove_column :photos, :meh, :integer
  end
end
