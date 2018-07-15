class Lecture < ApplicationRecord
    belongs_to :section
    has_many :questions, as: :questionable
end
