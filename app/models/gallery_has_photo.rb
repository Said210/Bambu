class GalleryHasPhoto < ApplicationRecord
    belongs_to :gallery
    belongs_to :photo
end
