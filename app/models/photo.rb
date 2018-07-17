class Photo < ApplicationRecord
    has_one_attached :image
    has_one :project, inverse_of: :cover # As the cover photo
    has_many :gallery_has_photos
    has_many :galleries, through: :gallery_has_photos
end
