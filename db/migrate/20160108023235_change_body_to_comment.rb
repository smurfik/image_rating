class ChangeBodyToComment < ActiveRecord::Migration
  def change
    rename_column :reviews, :body, :comment
  end
end
