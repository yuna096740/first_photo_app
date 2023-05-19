class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.string :photo_name
      t.text :caption

      t.timestamps
    end
  end
end
