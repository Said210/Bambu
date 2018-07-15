class UserTeachesCourse < ApplicationRecord
  belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id
  belongs_to :taught_course, class_name: 'Course', foreign_key: :taught_course_id

  validates :teacher, uniqueness: { scope: :taught_course}
end
