class Project < ApplicationRecord
  belongs_to :cover, class_name: 'Photo', foreign_key: :cover_id, optional: true, inverse_of: :project
  has_one :gallery
end
