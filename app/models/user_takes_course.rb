class UserTakesCourse < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: :student_id
  belongs_to :enrolled_course, class_name: 'Course' foreign_key: :enrolled_course_id
  
  validates :student, uniqueness: { scope: :enrolled_course}

end
