class CreateGalleryHasPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_has_photos do |t|
      t.references :gallery, foreign_key: true
      t.references :photo, foreign_key: true
      t.integer :order
      t.timestamps
    end
  end
end
