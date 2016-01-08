class AddRatingToReviews < ActiveRecord::Migration
  def change
    add_column :photos, :rating, :string
  end
end
