class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.integer :user_id
      t.string :image_file
      t.integer :thumbs_up, default: 0
      t.integer :meh, default: 0
      t.integer :thumbs_down, default: 0

      t.timestamps null: false
    end
  end
end
