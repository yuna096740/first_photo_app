class CreatePhotoComments < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_comments do |t|
      t.integer :user_id
      t.integer :photo_id
      t.text :comment

      t.timestamps
    end
  end
end
