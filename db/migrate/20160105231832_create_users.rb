class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :avatar
      t.boolean :notification, default: false

      t.timestamps null: false
    end
  end
end
