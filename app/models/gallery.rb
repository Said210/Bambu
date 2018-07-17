class Gallery < ApplicationRecord
  belongs_to :project
  has_many :gallery_has_photos
  has_many :photos, through: :gallery_has_photos
end
